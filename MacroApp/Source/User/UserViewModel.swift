import Foundation
import Domain
import Swinject
import Factory

final class UserViewModel {
    private let createUserUseCase: Domain.CreateUserUseCase
    private let deleteUserUseCase: Domain.DeleteUserUseCase
    private let getUserUseCase: Domain.GetUserUseCase
    private let id: Int
    init(createUserUseCase: Domain.CreateUserUseCase,
         deleteUserUseCase: Domain.DeleteUserUseCase,
         getUserUseCase: Domain.GetUserUseCase,
         id: Int) {
        self.createUserUseCase = createUserUseCase
        self.deleteUserUseCase = deleteUserUseCase
        self.getUserUseCase = getUserUseCase
        self.id = id
    }

    static func make(with id: Int) -> UserViewModel {
        UserViewModel(
            createUserUseCase: MDIDependency.resolve(),
            deleteUserUseCase: MDIDependency.resolve(),
            getUserUseCase: MDIDependency.resolve(),
            id: id
        )
    }
}

final class UserViewModelFactory {
    private let createUserProvider: any Resolver<CreateUserUseCase>
    private let deleteUserUseCaseProvider: any Resolver<DeleteUserUseCase>
    private let getUserUseCaseProvider: any Resolver<GetUserUseCase>

    init(createUserProvider: any Resolver<CreateUserUseCase>,
         deleteUserUseCaseProvider: any Resolver<DeleteUserUseCase>,
         getUserUseCaseProvider: any Resolver<GetUserUseCase>) {
        self.createUserProvider = createUserProvider
        self.deleteUserUseCaseProvider = deleteUserUseCaseProvider
        self.getUserUseCaseProvider = getUserUseCaseProvider
    }

    func create(id: Int) -> UserViewModel {
        return UserViewModel(createUserUseCase: createUserProvider.getInstance(),
                             deleteUserUseCase: deleteUserUseCaseProvider.getInstance(),
                             getUserUseCase: getUserUseCaseProvider.getInstance(),
                             id: id)
    }
}
