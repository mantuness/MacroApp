import Foundation
@testable import JSPlatform

extension NSError {
    static let mock: NSError = NSError(domain: "Mock Error", code: -1, userInfo: nil)
}
