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

final class UserViewControllerFactory {
    private let viewModelFactory: UserViewModelFactory
    init(viewModelFactory: UserViewModelFactory) {
        self.viewModelFactory = viewModelFactory
    }
    func create(id: Int, delegate: UserViewControllerDelegate) -> UserViewController {
        return UserViewController(viewModel: viewModelFactory.create(id: id), delegate: delegate)
    }
}
