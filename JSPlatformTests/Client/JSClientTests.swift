import XCTest
@testable import JSPlatform

class JSClientTests: XCTestCase {
    
    func testInvokeMethod() {
        let expectation = XCTestExpectation(description: "testInvokeMethod")

        let expectedValue = JSUser.mock
        Current = .init(mainJSContext: JSContext.mock(expectedValue))
        
        JSClient<JSUser>().invokeMethod("callOnSuccess", []) { result in
            switch result {
            case .success(let user):
                XCTAssertEqual(expectedValue, user)
            case .failure(let error):
                XCTFail("Didn't expect failure \(error)")
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1)
    }
    
    
    func testVoidInvokeMethod() {
        let expectation = XCTestExpectation(description: "testInvokeMethod")

        Current = .init(mainJSContext: JSContext.mock(JSUser.mock))
        
        JSClientVoid().invokeMethod("callOnSuccessVoid", nil) { result in
            switch result {
            case .success:
                XCTAssert(true)
            case .failure(let error):
                XCTFail("Didn't expect failure \(error)")
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1)
    }
    
    func testOnSuccessFailsToParseExpectedResult() {
        let expectation = XCTestExpectation(description: "testInvokeMethod")

        Current = .init(mainJSContext: JSContext.mock([JSUser.mock]))
        
        JSClient<[JSUser]>().invokeMethod("callOnSuccess", []) { result in
            switch result {
            case .success(let users):
                XCTFail("Didn't expect to succeed with \(users)")
            case .failure(let error):
                XCTAssertEqual(JSError.initialize(from: error).errorCode, -99)
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1)
    }
    
    func testOnErrorFailsToParseExpectedResult() {
        let expectation = XCTestExpectation(description: "testInvokeMethod")

        Current = .init(mainJSContext: JSContext.mock([JSUser.mock]))
        
        JSClient<[JSUser]>().invokeMethod("callOnErrorWithInvalidData", []) { result in
            switch result {
            case .success(let users):
                XCTFail("Didn't expect to succeed with \(users)")
            case .failure(let error):
                XCTAssertEqual(JSError.initialize(from: error).errorCode, -99)
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1)
    }
    
    func testOnErrorInvokeMethod() {
        let expectation = XCTestExpectation(description: "testInvokeMethod")

        let expectedValue = JSUser.mock
        Current = .init(mainJSContext: JSContext.mock(expectedValue))
        
        JSClient<JSUser>().invokeMethod("callOnError", []) { result in
            switch result {
            case .success:
                XCTFail("Didn't expect on success")
            case .failure(let error):
                XCTAssertEqual(JSError.mock, JSError.initialize(from: error))
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1)
    }
    
    func testVoidOnErrorInvokeMethod() {
        let expectation = XCTestExpectation(description: "testInvokeMethod")

        Current = .init(mainJSContext: JSContext.mock(JSUser.mock))
        
        JSClientVoid().invokeMethod("callOnError", []) { result in
            switch result {
            case .success:
                XCTFail("Didn't expect on success")
            case .failure(let error):
                XCTAssertEqual(JSError.mock, JSError.initialize(from: error))
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1)
    }
}

@objc
protocol JSEnvironmentMockable: JSExport {
    func callOnSuccess(_ onSuccess: JSValue, _ onError: JSValue)
    func callOnSuccessVoid(_ onSuccess: JSValue, _ onError: JSValue)
    func callOnError(_ onSuccess: JSValue, _ onError: JSValue)
    func callOnErrorWithInvalidData(_ onSuccess: JSValue, _ onError: JSValue)
}


extension JSValue {
    static let mock = { (context: JSContext, value: Encodable) in JSValue(with: context, value: value) }
    
    @objc class JSEnvironment: NSObject, JSEnvironmentMockable {
        var value: Encodable
        
        init(value: Encodable) {
            self.value = value
            super.init()
        }
        
        @objc func callOnSuccess(_ onSuccess: JSValue, _ onError: JSValue) {
            guard let json = value.toJSON(), let jsValue = JSValue(object: json, in: onSuccess.context) else {
                onSuccess.call(withArguments: [])
                return
            }
            onSuccess.call(withArguments: [jsValue])
        }
        
        @objc func callOnSuccessVoid(_ onSuccess: JSValue, _ onError: JSValue) {
            onSuccess.call(withArguments: [])
        }
        
        @objc func callOnError(_ onSuccess: JSValue, _ onError: JSValue) {
            guard let json = JSError.mock.toJSON(), let jsValue = JSValue(object: json, in: onError.context) else {
                onSuccess.call(withArguments: [])
                return
            }
            onError.call(withArguments: [jsValue])
        }
        
        @objc func callOnErrorWithInvalidData(_ onSuccess: JSValue, _ onError: JSValue) {
            onError.call(withArguments: [])
        }
    }

    convenience init(with context: JSContext, value: Encodable) {
        self.init(object: JSEnvironment(value: value), in: context)
    }
}
