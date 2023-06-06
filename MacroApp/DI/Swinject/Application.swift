import Foundation
import Domain
import Swinject

final class Application {
    static let shared: Application = Application()
    
    private let assembler: Assembler
    private init() {
        self.assembler = Assembler([ViewModelAssembly(),
                                    UseCaseAssembly(),
                                    RepositoryAssembly(),
                                    ServicesAssembly(),
                                    ClientAssembly(),
                                    CoordinatorAssembly(),
                                    ViewControllerAssembly()])
    }
    
    func resolve<T>(_ type: T.Type) -> T {
        return assembler.resolver.resolve(type)!
    }
}
