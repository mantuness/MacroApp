import Foundation

public struct ValidateUserIdUseCase: UseCase {
    public var execute: (Int) -> Bool = { input in
        return input == 1234
    }
    
    public init() {
        
    }
    
    internal init(execute: @escaping (Int) -> Bool) {
        self.execute = execute
    }
}

extension ValidateUserIdUseCase {
    public static let mock: Self = .init { _ in true }
}
