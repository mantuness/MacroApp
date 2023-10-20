import UIKit
import Swinject

protocol UserViewControllerDelegate: AnyObject {
    func goBack()
}

final class UserViewController: UIViewController {
    private weak var delegate: UserViewControllerDelegate?
    private let viewModel: UserViewModel
    init(viewModel: UserViewModel, delegate: UserViewControllerDelegate) {
        self.viewModel = viewModel
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if isMovingFromParent || isBeingDismissed {
            delegate?.goBack()
        }
    }
}

protocol UserViewControllerFactory {
    func create(id: Int, delegate: UserViewControllerDelegate) -> UserViewController
}

final class FactoryUserViewControllerFactory: UserViewControllerFactory {
    private let viewModelFactory: UserViewModelFactory
    init(viewModelFactory: UserViewModelFactory) {
        self.viewModelFactory = viewModelFactory
    }
    func create(id: Int, delegate: UserViewControllerDelegate) -> UserViewController {
        return UserViewController(viewModel: viewModelFactory.create(id: id), delegate: delegate)
    }
}

final class MDIUserViewControllerFactory: UserViewControllerFactory {
    func create(id: Int, delegate: UserViewControllerDelegate) -> UserViewController {
        UserViewController(
            viewModel: MDIDependency.resolve(UserViewModel.self, id),
            delegate: delegate
        )
    }
}
