import UIKit
import Swinject

protocol UserViewControllerDelegate: class {
    func goBack()
}

final class UserViewController: UIViewController {
    private weak var delegate: UserViewControllerDelegate?
    var viewModel: UserViewModel
    
    init(id: Int, delegate: UserViewControllerDelegate) {
        self.viewModel = .init(id: id)
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if isMovingFromParent || isBeingDismissed {
            delegate?.goBack()
        }
    }
}
