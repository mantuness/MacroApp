import Foundation
import JavaScriptCore

public protocol JSClient {
    func invokeMethod<T: Codable>(named: String, parameters: [Any]?, completion: @escaping ((Result<T, Error>) -> Void))
    func invokeMethod(named: String, parameters: [Any]?, completion: @escaping ((Result<Void, Error>) -> Void))
}

public final class JSClientImpl: JSClient {
    private let jsContext: JSContext = JSContext()
    private let mainJSValue: JSValue
    
    public init() {
        guard let mainJSPath = Bundle(for: JSClientImpl.self).path(forResource: "main", ofType: "js"),
            let stringJS = try? String(contentsOfFile: mainJSPath, encoding: String.Encoding.utf8) else {
                preconditionFailure("Failed to load JS context")
        }
        
        jsContext.evaluateScript(stringJS)
        let xmlHttpRequest = XMLHttpRequest()
        xmlHttpRequest.extend(jsContext)
        mainJSValue = jsContext.objectForKeyedSubscript("App")
    }
    
    public func invokeMethod<T>(named: String, parameters: [Any]?, completion: @escaping ((Result<T, Error>) -> Void)) where T: Codable {
        var arguments: [Any]?
        if let parameters = parameters {
            arguments?.append(parameters)
        }
        arguments?.append(onCompletionSuccess(closure: completion))
        arguments?.append(onCompletionFailure(closure: completion))
        mainJSValue.invokeMethod(named, withArguments: arguments)
    }
    
    public func invokeMethod(named: String, parameters: [Any]?, completion: @escaping ((Result<Void, Error>) -> Void)) {
        var arguments: [Any]?
        if let parameters = parameters {
            arguments?.append(parameters)
        }
        arguments?.append(onCompletionSuccess(closure: completion))
        arguments?.append(onCompletionFailure(closure: completion))
        mainJSValue.invokeMethod(named, withArguments: arguments)
    }
    
    private func onCompletionSuccess(closure: @escaping ((Result<Void, Error>) -> Void)) -> JSValue {
        let object: @convention(block) (JSValue?) -> Void = { jsValue in
            closure(.success(()))
        }
        return JSValue(object: object, in: jsContext)
    }
    
    private func onCompletionSuccess<T: Codable>(closure: @escaping ((Result<T, Error>) -> Void)) -> JSValue {
        let object: @convention(block) (JSValue?) -> Void = { jsValue in
            do {
                guard let dict = jsValue?.toDictionary() else {
                    throw NSError(domain: "No dict", code: -99, userInfo: nil)
                }
                let data = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
                let dataDecoded = try JSONDecoder().decode(T.self, from: data)
                closure(.success(dataDecoded))
            }
            catch let error {
                closure(.failure(JSError(error: error)))
            }
        }
        return JSValue(object: object, in: jsContext)
    }
    
    private func onCompletionFailure<T>(closure: @escaping ((Result<T, Error>) -> Void)) -> JSValue {
        let object: @convention(block) (JSValue?) -> Void = { jsValue in
            do {
                guard let dict = jsValue?.toDictionary() else {
                    throw NSError(domain: "No dict", code: -99, userInfo: nil)
                }
                let data = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
                let dataDecoded = try JSONDecoder().decode(JSError.self, from: data)
                closure(.failure(dataDecoded))
            }
            catch let error {
                closure(.failure(JSError(error: error)))
            }
        }
        return JSValue(object: object, in: jsContext)
    }
}
