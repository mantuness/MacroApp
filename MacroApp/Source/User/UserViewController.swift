import UIKit
import Swinject

protocol UserViewControllerDelegate: class {
    func didTapSettings()
}

final class UserViewController: UIViewController {
    private weak var delegate: UserViewControllerDelegate?
    private let viewModel: UserViewModel
    init(viewModel: UserViewModel, delegate: UserViewControllerDelegate) {
        self.viewModel = viewModel
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

final class UserViewControllerFactory {
    let provider: Provider<UserViewModel>
    init(provider: Provider<UserViewModel>) {
        self.provider = provider
    }
    func create(delegate: UserViewControllerDelegate) -> UserViewController {
        return UserViewController(viewModel: provider.instance, delegate: delegate)
    }
}
