import Foundation

public struct JSError: Error, Codable, Equatable {
    let errorCode: Int
    let errorMessage: String?
    
    init(error: Error) {
        self.errorCode = (error as NSError).code
        self.errorMessage = error.localizedDescription
    }
    
    static func initialize(from error: Error) -> JSError {
        return error as? JSError ?? JSError(error: error)
    }
}
