import UIKit
import Swinject

protocol SettingsViewControllerDelegate: class {
    func didPressButtonX()
}

final class SettingsViewController: UIViewController {
    private weak var delegate: SettingsViewControllerDelegate?
    private let viewModel: SettingsViewModel
    init(viewModel: SettingsViewModel, delegate: SettingsViewControllerDelegate) {
        self.viewModel = viewModel
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
    }
}
