import Foundation

protocol DomainConvertibleType {
    associatedtype DomainType

    func asDomain() throws -> DomainType
}
