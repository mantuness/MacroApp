import Foundation

struct Environment {
    var mainJSContext = loadJSEnvironment()
}

private extension Environment {
    class BundleClass {}
}

private func loadJSEnvironment() -> JSContext {
    guard let mainJSPath = Bundle(for: Environment.BundleClass.self).path(forResource: "main", ofType: "js"),
        let stringJS = try? String(contentsOfFile: mainJSPath, encoding: String.Encoding.utf8), let jsContext = JSContext() else {
            preconditionFailure("Failed to load JS context")
    }
    
    jsContext.evaluateScript(stringJS)
    
    let xmlHttpRequest = XMLHttpRequest()
    xmlHttpRequest.extend(jsContext)
    
    return jsContext
}

var Current = Environment()
