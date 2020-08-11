import Foundation

public final class ValidateUserIdUseCase: UseCase {
    public init() {}
    public func execute(input: Int) -> Bool {
        return input == 1234
    }
}
