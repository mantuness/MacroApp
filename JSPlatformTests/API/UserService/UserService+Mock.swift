import Foundation
@testable import JSPlatform

extension UserService {
    public static let mock = UserService(
        getUser: { id, callback in
            callback(.success(.mock))
        },
        newUser: { name, _, callback in
            callback(.success(.newUserMock))
        },
        deleteUser: { id, callback in
            callback(.success(()))
        }
    )
    
    public static let failureMock = UserService(
        getUser: { id, callback in
            callback(.failure(NSError.mock))
        },
        newUser: { name, _, callback in
            callback(.failure(NSError.mock))
        },
        deleteUser: { id, callback in
            callback(.failure(NSError.mock))
        }
    )
}
