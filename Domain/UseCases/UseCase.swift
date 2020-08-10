import Foundation

public protocol UseCase {
    associatedtype Input
    associatedtype Output
    func execute(input: Input) -> Output
}
