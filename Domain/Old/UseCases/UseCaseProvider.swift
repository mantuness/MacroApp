import Foundation

public protocol UseCaseProvider {
    func makeConfigUseCase() -> ConfigUseCase
}
