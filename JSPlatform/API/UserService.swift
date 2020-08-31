import Foundation

public struct UserService {
    public var getUser = getUser(id:completion:)
    public var newUser = newUser(name:password:completion:)
    public var deleteUser = deleteUser(id:completion:)
    
    public init() {
        
    }
    
    internal init (
        getUser: @escaping (Int, @escaping (Result<JSUser, Error>) -> Void) -> (),
        newUser: @escaping (String, String, @escaping (Result<JSUser, Error>) -> Void) -> (),
        deleteUser: @escaping (Int, @escaping (Result<Void, Error>) -> Void) -> ()
    ) {
        self.getUser = getUser
        self.newUser = newUser
        self.deleteUser = deleteUser
    }
}

private func getUser(id: Int, completion: @escaping (Result<JSUser, Error>) -> Void) {
    JSClient().invokeMethod("JSDispatcherModule.getUser", [id], completion)
}

private func newUser(name: String, password: String, completion: @escaping (Result<JSUser, Error>) -> Void) {
    JSClient().invokeMethod("JSDispatcherModule.newUser", nil, completion)
}

private func deleteUser(id: Int, completion: @escaping (Result<Void, Error>) -> Void ) {
    JSClientVoid().invokeMethod("JSDispatcherModule.deleteUser", nil, completion)
}

extension UserService {
    public static var mock = UserService(
        getUser: { id, callback in
            callback(.success(JSUser(id: id, name: "Already existing user")))
        },
        newUser: { name, _, callback in
            callback(.success(.init(id: 1, name: name)))
        },
        deleteUser: { id, callback in
            callback(.success(()))
        }
    )
}
