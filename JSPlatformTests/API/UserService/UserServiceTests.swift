import XCTest
@testable import JSPlatform

class UserServiceTests: XCTestCase {
    // MARK: - Get User
    func testGetUserSucceedesWithExpectedUser() {
        let sut: UserService = .mock
        
        sut.getUser(JSUser.mock.id) { result in
            switch result {
            case .success(let user):
                XCTAssertEqual(user, JSUser.mock)
            case .failure(let error):
                XCTFail("Failed with error: \(error.localizedDescription)")
            }
        }
    }
    
    func testGetUserFailsWithError() {
        let sut: UserService = .failureMock

        sut.getUser(JSUser.mock.id) { result in
            switch result {
            case .success:
                XCTFail("It shouldn't have succeeded")
            case .failure(let error):
                XCTAssertEqual(JSError.initialize(from: error), JSError.mock)
            }
        }
    }
    
    // MARK: - New User
    func testNewUserSucceedesWithExpectedNewUser() {
        let sut: UserService = .mock
        
        sut.newUser(JSUser.newUserMock.name, "password") { result in
            switch result {
            case .success(let user):
                XCTAssertEqual(user, JSUser.newUserMock)
            case .failure(let error):
                XCTFail("Failed with error: \(error.localizedDescription)")
            }
        }
    }
    
    func testNewUserFailsWithError() {
        let sut: UserService = .failureMock

        sut.newUser(JSUser.newUserMock.name, "password") { result in
            switch result {
            case .success:
                XCTFail("It shouldn't have succeeded")
            case .failure(let error):
                XCTAssertEqual(JSError.initialize(from: error), JSError.mock)
            }
        }
    }
    
    // MARK: - Delete User
    func testDeleteUserSucceedes() {
        let sut: UserService = .mock
        
        sut.deleteUser(JSUser.mock.id) { result in
            switch result {
            case .success:
                XCTAssert(true)
            case .failure(let error):
                XCTFail("Failed with error: \(error.localizedDescription)")
            }
        }
    }
    
    func testDeleteUserFailsWithError() {
        let sut: UserService = .failureMock

        sut.deleteUser(JSUser.mock.id) { result in
            switch result {
            case .success:
                XCTFail("It shouldn't have succeeded")
            case .failure(let error):
                XCTAssertEqual(JSError.initialize(from: error), JSError.mock)
            }
        }
    }
}

