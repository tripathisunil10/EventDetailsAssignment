
import Foundation
struct Event_organizer : Codable {
	let organizer_id : String?
	let o_name : String?
	let o_name_ar : String?
	let o_logo : String?
	let o_detail : String?
	let o_detail_ar : String?
	let o_contact : String?
	let o_email : String?
	let o_website : String?
	let o_image : String?
	let o_status : String?
	let o_created_at : String?
	let event_organizer_id : String?

	enum CodingKeys: String, CodingKey {

		case organizer_id = "organizer_id"
		case o_name = "o_name"
		case o_name_ar = "o_name_ar"
		case o_logo = "o_logo"
		case o_detail = "o_detail"
		case o_detail_ar = "o_detail_ar"
		case o_contact = "o_contact"
		case o_email = "o_email"
		case o_website = "o_website"
		case o_image = "o_image"
		case o_status = "o_status"
		case o_created_at = "o_created_at"
		case event_organizer_id = "event_organizer_id"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		organizer_id = try? values.decodeIfPresent(String.self, forKey: .organizer_id)
		o_name = try? values.decodeIfPresent(String.self, forKey: .o_name)
		o_name_ar = try? values.decodeIfPresent(String.self, forKey: .o_name_ar)
		o_logo = try? values.decodeIfPresent(String.self, forKey: .o_logo)
		o_detail = try? values.decodeIfPresent(String.self, forKey: .o_detail)
		o_detail_ar = try? values.decodeIfPresent(String.self, forKey: .o_detail_ar)
		o_contact = try? values.decodeIfPresent(String.self, forKey: .o_contact)
		o_email = try? values.decodeIfPresent(String.self, forKey: .o_email)
		o_website = try? values.decodeIfPresent(String.self, forKey: .o_website)
		o_image = try? values.decodeIfPresent(String.self, forKey: .o_image)
		o_status = try? values.decodeIfPresent(String.self, forKey: .o_status)
		o_created_at = try? values.decodeIfPresent(String.self, forKey: .o_created_at)
		event_organizer_id = try? values.decodeIfPresent(String.self, forKey: .event_organizer_id)
	}

}
