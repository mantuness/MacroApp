import UIKit
import Swinject

protocol SettingsViewControllerDelegate: class {
    func didPressUserButton(userId: Int)
    func didTapClose()
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
    
    @IBOutlet var textField: UITextField!
    @IBOutlet var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.addTarget(self, action: #selector(editingDidChange), for: .editingChanged)
        button.isEnabled = false
        button.backgroundColor = .red
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @objc
    private func editingDidChange() {
        guard let text = textField.text,
            let id = Int(text) else { return }
        let isValid = viewModel.validateData(userId: id)
        button.isEnabled = isValid
        button.backgroundColor = isValid ? .green : .red
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        guard let text = textField.text,
            let id = Int(text) else { return }
        delegate?.didPressUserButton(userId: id)
    }
    @IBAction func didTapClose(_ sender: UIButton) {
        delegate?.didTapClose()
    }
}

final class SettingsViewControllerFactory {
    private let viewModelProvider: Provider<SettingsViewModel>
    init(viewModelProvider: Provider<SettingsViewModel>) {
        self.viewModelProvider = viewModelProvider
    }
    func create(delegate: SettingsViewControllerDelegate) -> SettingsViewController {
        return SettingsViewController(viewModel: viewModelProvider.instance, delegate: delegate)
    }
}
