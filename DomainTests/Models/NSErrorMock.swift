import Foundation
@testable import Domain

extension NSError {
    static let mock = NSError(domain: "UseCaseTests", code: 0, userInfo: nil)
}
