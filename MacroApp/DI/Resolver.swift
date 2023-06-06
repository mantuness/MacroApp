import Foundation

// This protocol only exists so we can easily switch between Factory and Swinject
protocol Resolver<T> {
    associatedtype T
    func getInstance() -> T
}
