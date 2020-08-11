import Foundation

public protocol UserRepository {
    func getUser(id: Int, completion: @escaping (Result<User, Error>) -> Void)
    func createUser(name: String, password: String, completion: (Result<User, Error>) -> Void)
    func delete(id: Int)
}
