import Foundation

public protocol ConfigUseCase {
    func configs() -> [Config]
}
