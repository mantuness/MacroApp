import Foundation

public protocol UserService {
    func getUser(id: Int, completion: @escaping (Result<JSUser, Error>) -> Void)
    func newUser(name: String, password: String, completion: @escaping (Result<JSUser, Error>) -> Void)
    func deleteUser(id: Int, completion: @escaping (Result<Void, Error>) -> Void )
}

public final class JSUserService: UserService {
    private let client: JSClient
    public init(client: JSClient) {
        self.client = client
    }
    
    public func getUser(id: Int, completion: @escaping (Result<JSUser, Error>) -> Void) {
        client.invokeMethod(named: "JSDispatcherModule.getUser", parameters: [id], completion: completion)
    }
    
    public func newUser(name: String, password: String, completion: @escaping (Result<JSUser, Error>) -> Void) {
        client.invokeMethod(named: "JSDispatcherModule.newUser", parameters: nil, completion: completion)
    }
    
    public func deleteUser(id: Int, completion: @escaping (Result<Void, Error>) -> Void ) {
        client.invokeMethod(named: "JSDispatcherModule.deleteUser", parameters: nil, completion: completion)
    }
}
