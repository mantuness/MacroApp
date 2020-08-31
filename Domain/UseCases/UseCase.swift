import Foundation

public protocol UseCase {
    associatedtype Input
    associatedtype Output
    var execute: (Input) -> Output { get set }
}
