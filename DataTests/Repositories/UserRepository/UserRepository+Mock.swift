import XCTest
import JSPlatform
@testable import Data

extension UserRepository {
    static let mock: (UserService) -> UserRepository = { .init(jsUserService: $0) }
}

extension JSUser {
    static let mock: Self = .init(id: 0, name: "Mock User")
}
