import XCTest
@testable import Domain

extension CreateUserUseCase {
    static let mock: Self = .init { (input) in
        input.completion(.success(.init(id: 0, name: input.name)))
    }
}
