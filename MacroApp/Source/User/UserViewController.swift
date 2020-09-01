import UIKit
import Swinject

protocol UserViewControllerDelegate: class {
    func goBack()
}

final class UserViewController: UIViewController {
    private weak var delegate: UserViewControllerDelegate?
    private let viewModel: UserViewModel
    init(id: Int, delegate: UserViewControllerDelegate) {
        self.viewModel = .init(id: id)
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

extension UserViewController {
    static let mock: UserViewController = .init(id: 30, delegate: MockUserViewControllerDelegate())
    
    class MockUserViewControllerDelegate: UserViewControllerDelegate {
        var didCallGoBack = false
        
        func goBack() {
            didCallGoBack = true
        }
    }
}
