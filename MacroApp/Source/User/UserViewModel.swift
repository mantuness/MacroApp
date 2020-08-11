import Foundation
import Domain
import Swinject

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
    }
}

final class UserViewModelFactory {
    let createUserProvider: Provider<CreateUserUseCase>
    let deleteUserUseCaseProvider: Provider<DeleteUserUseCase>
    let getUserUseCaseProvider: Provider<GetUserUseCase>
    init(createUserProvider: Provider<CreateUserUseCase>,
         deleteUserUseCaseProvider: Provider<DeleteUserUseCase>,
         getUserUseCaseProvider: Provider<GetUserUseCase>) {
        self.createUserProvider = createUserProvider
        self.deleteUserUseCaseProvider = deleteUserUseCaseProvider
        self.getUserUseCaseProvider = getUserUseCaseProvider
    }
    func create(id: Int) -> UserViewModel {
        return UserViewModel(createUserUseCase: createUserProvider.instance,
                             deleteUserUseCase: deleteUserUseCaseProvider.instance,
                             getUserUseCase: getUserUseCaseProvider.instance,
                             id: id)
    }
}





