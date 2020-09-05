import Foundation
import JavaScriptCore

public struct JSClient<T: Codable> {
    var invokeMethod: (_ named: String, _ parameters: [Any]?, _ completion: @escaping ((Result<T, Error>) -> Void)) -> Void  = invokeMethod(named:parameters: completion:)
}

public struct JSClientVoid {
    var invokeMethod = invokeMethod(named:parameters:completion:)
}

private func invokeMethod<T>(named: String, parameters: [Any]?, completion: @escaping ((Result<T, Error>) -> Void)) where T: Codable {
    var arguments = parameters ?? []
    arguments.append(onCompletionSuccess(closure: completion))
    arguments.append(onCompletionFailure(closure: completion))
    
    if Current.mainJSContext.mainJSValue?.hasProperty(named) == true {
        Current.mainJSContext.mainJSValue?.invokeMethod(named, withArguments: arguments)
    } else {
        let error = JSError(
            error: NSError(
                domain: "Property does not exist",
                code: -1,
                userInfo: nil
            )
        )
        completion(.failure(error))
    }
}

private func invokeMethod(named: String, parameters: [Any]?, completion: @escaping ((Result<Void, Error>) -> Void)) {
    var arguments = parameters ?? []
    arguments.append(onCompletionSuccess(closure: completion))
    arguments.append(onCompletionFailure(closure: completion))
    Current.mainJSContext.mainJSValue?.invokeMethod(named, withArguments: arguments)
}

private func onCompletionSuccess(closure: @escaping ((Result<Void, Error>) -> Void)) -> JSValue {
    let object: @convention(block) (JSValue?) -> Void = { jsValue in
        closure(.success(()))
    }
    return JSValue(object: object, in: Current.mainJSContext)
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
            closure(.failure(JSError.initialize(from: error)))
        }
    }
    return JSValue(object: object, in: Current.mainJSContext)
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
            closure(.failure(JSError.initialize(from: error)))
        }
    }
    return JSValue(object: object, in: Current.mainJSContext)
}


extension JSContext {
    var mainJSValue: JSValue? {
        self.objectForKeyedSubscript("App")
    }
}
