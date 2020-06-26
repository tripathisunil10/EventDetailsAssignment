

import Foundation
struct EventDetailsMaster : Codable {
	let error : Bool?
	let error_code : Int?
	let message : String?
	let data : EventData?

	enum CodingKeys: String, CodingKey {

		case error = "error"
		case error_code = "error_code"
		case message = "message"
		case data = "data"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		error = try? values.decodeIfPresent(Bool.self, forKey: .error)
		error_code = try? values.decodeIfPresent(Int.self, forKey: .error_code)
		message = try? values.decodeIfPresent(String.self, forKey: .message)
		data = try? values.decodeIfPresent(EventData.self, forKey: .data)
	}

}
