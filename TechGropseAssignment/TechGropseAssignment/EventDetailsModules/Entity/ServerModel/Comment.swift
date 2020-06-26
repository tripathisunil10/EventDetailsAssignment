

import Foundation
struct Comment : Codable {
	let comment_id : String?
	let ec_event_id : String?
	let ec_user_id : String?
	let ec_comment : String?
	let ec_status : String?
	let ec_created_at : String?
	let u_name : String?
	let u_image : String?

	enum CodingKeys: String, CodingKey {

		case comment_id = "comment_id"
		case ec_event_id = "ec_event_id"
		case ec_user_id = "ec_user_id"
		case ec_comment = "ec_comment"
		case ec_status = "ec_status"
		case ec_created_at = "ec_created_at"
		case u_name = "u_name"
		case u_image = "u_image"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		comment_id = try? values.decodeIfPresent(String.self, forKey: .comment_id)
		ec_event_id = try? values.decodeIfPresent(String.self, forKey: .ec_event_id)
		ec_user_id = try? values.decodeIfPresent(String.self, forKey: .ec_user_id)
		ec_comment = try? values.decodeIfPresent(String.self, forKey: .ec_comment)
		ec_status = try? values.decodeIfPresent(String.self, forKey: .ec_status)
		ec_created_at = try? values.decodeIfPresent(String.self, forKey: .ec_created_at)
		u_name = try? values.decodeIfPresent(String.self, forKey: .u_name)
		u_image = try? values.decodeIfPresent(String.self, forKey: .u_image)
	}

}
