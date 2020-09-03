import Domain
import JSPlatform
import XCTest
@testable import Data

class UserRepositoryTests: XCTestCase {

    func testGetUserSucceedsWithCorrectUser() {
        let jsUser: JSUser = .mock
        
        var userService = UserService()
        userService.getUser = { id, completion in
            completion(.success(jsUser))
        }
        
        let userRepository: Domain.UserRepository = UserRepository.mock(userService)

        userRepository.getUser(id: jsUser.id) { result in
            switch result {
            case .success(let user):
                XCTAssertEqual(user.asJS(), jsUser)
            case .failure(let error):
                XCTFail("Didn't expect to fail with error: \(error)")
            }
        }
    }

    func testCreateUserSucceedsWithCorrectUser() {
        let jsUser: JSUser = .mock
        
        var userService = UserService()
        userService.newUser = { name, password, completion in
            completion(.success(jsUser))
        }
        
        let userRepository: Domain.UserRepository = UserRepository.mock(userService)

        userRepository.createUser(name: jsUser.name, password: "") { result in
            switch result {
            case .success(let user):
                XCTAssertEqual(user.asJS(), jsUser)
            case .failure(let error):
                XCTFail("Didn't expect to fail with error: \(error)")
            }
        }
    }
    
    func testDeleteUserSucceeds() {
        let jsUser: JSUser = .mock
        
        var userService = UserService()
        userService.deleteUser = { id, completion in
            completion(.success(()))
        }
        
        let userRepository: Domain.UserRepository = UserRepository.mock(userService)

        userRepository.delete(id: jsUser.id) { result in
            switch result {
            case .success:
                XCTAssert(true)
            case .failure(let error):
                XCTFail("Didn't expect to fail with error: \(error)")
            }
        }
    }
}
