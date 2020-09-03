import Foundation
@testable import JSPlatform

extension JSContext {
    static let mock = { (value: Encodable) -> JSContext in
        let context = MockJSContext()!
        context.value = value
        return context
    }
    
    class MockJSContext: JSContext {
        var value: Encodable!
    
        override func objectForKeyedSubscript(_ key: Any!) -> JSValue! {
            if let key = key as? String, key == "App" {
                return JSValue.mock(self, value)
            }
            
            return super.objectForKeyedSubscript(key)
        }
    }
}
