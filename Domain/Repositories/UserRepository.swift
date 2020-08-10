import Foundation

public protocol UserRepository {
    func createUser(name: String, password: String, completion: (Result<Domain.User, Error>) -> Void)
    func delete(id: Int)
}
