import Foundation

public struct JSError: Error, Codable {
    let errorCode: Int
    let errorMessage: String?
    
    init(error: Error) {
        self.errorCode = (error as NSError).code
        self.errorMessage = error.localizedDescription
    }
}
