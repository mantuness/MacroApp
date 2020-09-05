import Foundation
@testable import Domain

extension UserRepository {
    static let mock: (User) -> Self = { user in
        .init(
            getUser: { $1(.success(user)) },
            createUser: { $2(.success(user)) },
            delete: {$1(.success(()))}
        )
    }
    
    static let failureMock: (Error) -> UserRepository = { error in
        .init(
            getUser: { $1(.failure(error)) },
            createUser: { $2(.failure(error)) },
            delete: {$1(.failure(error))}
        )
    }
}

