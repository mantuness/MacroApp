import Foundation

public protocol UserService {
    func getUser(id: Int, completion: @escaping (Result<JSUser, Error>) -> Void)
    func newUser(name: String, password: String, completion: (Result<JSUser, Error>) -> Void) // (Different team implementing these services)
    func deleteUser(id: Int)
}

public final class JSUserService: UserService {
    private let client: JSClient
    public init(client: JSClient) {
        self.client = client
    }
    
    public func getUser(id: Int, completion: @escaping (Result<JSUser, Error>) -> Void) {
        let successClosure: (JSUser) -> Void = { jsUser in
            completion(Result.success(jsUser))
        }
        
        let failureClosure: (Error) -> Void = { error in
            completion(Result.failure(error))
        }
        client.invokeMethod(named: "GET.USER", parameters: [id], success: successClosure, failure: failureClosure)
    }
    
    public func newUser(name: String, password: String, completion: (Result<JSUser, Error>) -> Void) {
//        client.invokeMethod(named: <#T##String#>, parameters: <#T##[Any]?#>, success: <#T##(() -> JSClient.T)?##(() -> JSClient.T)?##() -> JSClient.T#>, failure: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>)
    }
    
    public func deleteUser(id: Int) {
//        client.invokeMethod(named: <#T##String#>, parameters: <#T##[Any]?#>, success: <#T##(() -> JSClient.T)?##(() -> JSClient.T)?##() -> JSClient.T#>, failure: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>)
    }
}
