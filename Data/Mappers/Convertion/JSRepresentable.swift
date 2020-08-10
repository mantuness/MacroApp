import Foundation

protocol JSRepresentable {
    associatedtype JSType: DomainConvertibleType

    func asJS() -> JSType
}
