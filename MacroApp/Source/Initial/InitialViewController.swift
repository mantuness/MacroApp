import UIKit
import JSPlatform

protocol InitialViewControllerDelegate: class {
    func didTapSettingsButton()
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

    @IBAction func didTapSettingsCurrentPatternButton(_ sender: UIButton) {
        delegate?.didTapSettingsCurrentPatternButton()
    }
}

extension InitialViewController {
    static let mock: InitialViewController = .init(delegate: MockInitialViewControllerDelegate())
    
    // this shouldn't be here move to tests
    class MockInitialViewControllerDelegate: InitialViewControllerDelegate {
        var didCallTappSettingsButton = false
        var didCallTapSettingsCurrentPatternButton = false
        
        func didTapSettingsButton() {
            didCallTappSettingsButton = true
        }
        
        func didTapSettingsCurrentPatternButton() {
            didCallTapSettingsCurrentPatternButton = true
        }
    }
}

