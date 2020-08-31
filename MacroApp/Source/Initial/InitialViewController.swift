import UIKit
import JSPlatform

protocol InitialViewControllerDelegate: class {
    func didTapSettingsButton()
    func didTapSettingsNonDIButton()
    func didTapSettingsCurrentPatternButton()
}

final class InitialViewController: UIViewController {
    private weak var delegate: InitialViewControllerDelegate?
    private let viewModel: InitialViewModel = .init()
    
    init(delegate: InitialViewControllerDelegate) {
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

struct InitialViewControllerFactory {
    var create: (InitialViewControllerDelegate) -> InitialViewController = { delegate in
        .init(delegate: delegate) // i'm not really a fan of this one as well
    }
}

extension InitialViewControllerFactory {
    static var mock = InitialViewControllerFactory(
        create: { delegate in
            .init(delegate: delegate)
        }
    )
}

