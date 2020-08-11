import Foundation
import JavaScriptCore

public protocol JSClient {
    func invokeMethod<T: Codable>(named: String, parameters: [Any]?, success: ((T) -> Void)?, failure: ((Error) -> Void)?)
    func invokeMethod(named: String, parameters: [Any]?, success: (() -> Void)?, failure: ((Error) -> Void)?)
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
    
    //    private func onSuccess(onSuccess: () -> T) -> JSValue {
    //        let onSuccess: @convention(block) (JSValue?) -> Void = { data in
    //            print(String(describing: data?.description))
    //            return data -> RailJS
    //        }
    //        return JSValue(object: onSuccess, in: context)
    //    }
    //    private func onError(context: JSContext) -> JSValue {
    //        let onError: @convention(block) (JSValue?) -> Void = { error in
    //           print(String(describing: error?.description))
    //        }
    //        return JSValue(object: onError, in: context)
    //    }
    
    //    func invokeMethod(named: String, parameters: [Any]?, success: (() -> T)?, failure: (() -> Void)?) {
    ////        onSuccess(context: <#T##JSContext#>)
    //        mainJSValue.invokeMethod(named, withArguments: [])
    //    }
    
    public func invokeMethod<T>(named: String, parameters: [Any]?, success: ((T) -> Void)?, failure: ((Error) -> Void)?) {
        
    }
    
    public func invokeMethod(named: String, parameters: [Any]?, success: (() -> Void)?, failure: ((Error) -> Void)?) {
        
    }
}


//struct PropositionData {
//    static let siteName = "peacock"
//    static let territory = "us"
//    static let provider = "nbcu"
//    static let proposition = "nbcuott"
//    static let platform = "youitv"
//    static let devicePlatform = "appletv"
//    static let deviceInfo = [
//        "deviceType": "IPSETTOPBOX",
//        "devicePlatform": "APPLETV",
//        "maxVideoFormat": "HD"
//    ]
//
//    static var launchOptions: [String: Any] = [
//        "territory": PropositionData.territory,
//        "provider": PropositionData.provider,
//        "proposition": PropositionData.proposition,
//        "platform": PropositionData.platform,
//        "devicePlatform": PropositionData.devicePlatform,
//        "deviceInfo": PropositionData.deviceInfo,
//        "environment": "production",
//        "configVersion": "1.0.0",
//        "configServer": "https://config.clients.peacocktv.com",
//        "defaultLanguage": "en",
//        "timeConfig": ["dateFormat": "LL",
//                       "timeFormat": "h:mma"],
//        "versionNumber": "1.0.0",
//        "sentryDSN": ""]
//}

//public class ProviderJS {
//    public init() {}
//    public func teste() {
//        guard let mainJSPath = Bundle(for: ProviderJS.self).path(forResource: "main", ofType: "js"),
//            let stringJS = try? String(contentsOfFile: mainJSPath, encoding: String.Encoding.utf8) else { return }
//
//        let jsContext = JSContext()
//        jsContext?.evaluateScript(stringJS)
//        let appObject = jsContext?.objectForKeyedSubscript("App")
//        let hasPropertyOnLaunch = appObject?.hasProperty("onLaunch")
//        print("MARCELO: hasPropertyOnLaunch -> \(String(describing: hasPropertyOnLaunch))")
//        appObject?.invokeMethod("onLaunch", withArguments: [PropositionData.launchOptions])
//        let xmlHttpRequest = XMLHttpRequest()
//        xmlHttpRequest.extend(jsContext)
//        let onSuccessClosure = onSuccess(context: jsContext!)
//        let onErrorClosure = onError(context: jsContext!)
//        appObject?.invokeMethod("marceloFetchConfigs", withArguments: [onSuccessClosure, onErrorClosure])
//
////        let hasPropertyBootstrapServices = appObject?.hasProperty("bootstrapServices")
////        print("MARCELO: hasPropertyBootstrapServices -> \(String(describing: hasPropertyBootstrapServices))")
////        let onSuccessClosure1 = onSuccess(context: jsContext!)
////        let onErrorClosure1 = onError(context: jsContext!)
////        appObject?.invokeMethod("bootstrapServices", withArguments: ["MarceloDeviceId", onSuccessClosure1, onErrorClosure1])
//    }
//
//    private func onSuccess(context: JSContext) -> JSValue {
//        let onSuccess: @convention(block) (JSValue?) -> Void = { data in
//            print(String(describing: data?.description))
//            return data
//        }
//        return JSValue(object: onSuccess, in: context)
//    }
//    private func onError(context: JSContext) -> JSValue {
//        let onError: @convention(block) (JSValue?) -> Void = { error in
//           print(String(describing: error?.description))
//        }
//        return JSValue(object: onError, in: context)
//    }
//
//}
