import Foundation

extension Encodable {
    func toJSON() -> [String: Any]? {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        encoder.dateEncodingStrategy = .iso8601
        guard let jsonData = try? encoder.encode(self) else { return nil }
        return try? JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any]
    }
}
