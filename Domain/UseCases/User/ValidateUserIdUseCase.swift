import Foundation

public struct ValidateUserIdUseCase: UseCase {
    public var execute: (Int) -> Bool = { input in
        return input == 1234
    }
    
    public init() {
        
    }
}
