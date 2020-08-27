import Foundation
import UIKit

protocol SettingsNonDIViewControllerDelegate: class {
    func didPressUserButton(userId: Int)
    func didTapClose()
}

final class SettingsNonDIViewController: UIViewController {
    private weak var delegate: SettingsNonDIViewControllerDelegate?
    private let viewModel: SettingsNonDIViewModel
    
    init(viewModel: SettingsNonDIViewModel, delegate: SettingsNonDIViewControllerDelegate) {
        self.viewModel = viewModel
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .magenta
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
