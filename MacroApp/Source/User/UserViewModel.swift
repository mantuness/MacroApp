import Foundation
import Domain
import Swinject

final class UserViewModel {
    var id: Int
    
    init(id: Int) {
        self.id = id
    }
}

extension UserViewModel {
    static let mock: UserViewModel = .init(id: 100)
}

struct UserViewModelFactory {
    func create(id: Int) -> UserViewModel {
        return UserViewModel(id: id)
    }
}
