import UIKit

final class InitialViewController: UIViewController {
    
    private let viewModel: InitialViewModel
    init(viewModel: InitialViewModel) {
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.bootstrap()
    }

}
