import UIKit
import Swinject

protocol InitialViewControllerDelegate: class {
    func didTapSettingsButton()
    func didTapSettingsNonDIButton()
    func didTapSettingsCurrentPatternButton()
}

final class InitialViewController: UIViewController {
    private weak var delegate: InitialViewControllerDelegate?
    private let viewModel: InitialViewModel
    init(viewModel: InitialViewModel, delegate: InitialViewControllerDelegate) {
        self.viewModel = viewModel
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.bootstrap()
    }
    
    @IBAction func didTapButton(_ sender: UIButton) {
        delegate?.didTapSettingsButton()
    }
    
    @IBAction func didTapSettingsNonDIButton(_ sender: UIButton) {
        delegate?.didTapSettingsNonDIButton()
    }
    
    @IBAction func didTapSettingsCurrentPatternButton(_ sender: UIButton) {
        
    }
}

final class InitialViewControllerFactory {
    private let viewModelProvider: Provider<InitialViewModel>
    init(viewModelProvider: Provider<InitialViewModel>) {
        self.viewModelProvider = viewModelProvider
    }
    func create(delegate: InitialViewControllerDelegate) -> InitialViewController {
        return InitialViewController(viewModel: viewModelProvider.instance, delegate: delegate)
    }
}
