import UIKit
import Swinject

protocol InitialViewControllerDelegate: AnyObject {
    func didTapSettingsButton()
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
}

final class ViewModelProvider {
    func make() -> InitialViewModel {
        InitialViewModel(
            getConfigsUseCase: MDIDependency.resolve(),
            getFFUseCase: MDIDependency.resolve()
        )
    }
}

protocol InitialViewControllerFactory {
    func create(delegate: InitialViewControllerDelegate) -> InitialViewController
}

final class ResolverInitialViewControllerFactory: InitialViewControllerFactory {
    private let viewModelProvider: any Resolver<InitialViewModel>
    init(viewModelProvider: any Resolver<InitialViewModel>) {
        self.viewModelProvider = viewModelProvider
    }

    func create(delegate: InitialViewControllerDelegate) -> InitialViewController {
        return InitialViewController(viewModel: viewModelProvider.getInstance(), delegate: delegate)
    }
}

final class MDIInitialViewControllerFactory: InitialViewControllerFactory {
    private let viewModelProvider: ViewModelProvider

    init(viewModelProvider: ViewModelProvider) {
        self.viewModelProvider = viewModelProvider
    }

    func create(delegate: InitialViewControllerDelegate) -> InitialViewController {
        InitialViewController(
            viewModel: viewModelProvider.make(),
            delegate: delegate
        )
    }
}
