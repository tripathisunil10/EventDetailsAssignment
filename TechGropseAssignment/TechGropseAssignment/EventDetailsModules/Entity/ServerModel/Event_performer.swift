
import Foundation
struct Event_performer : Codable {
	let performer_id : String?
	let p_name : String?
	let p_name_ar : String?
	let p_logo : String?
	let p_detail : String?
	let p_detail_ar : String?
	let p_type : String?
	let p_contact : String?
	let p_email : String?
	let p_website : String?
	let p_image : String?
	let p_status : String?
	let p_created_at : String?
	let event_organizer_id : String?

	enum CodingKeys: String, CodingKey {

		case performer_id = "performer_id"
		case p_name = "p_name"
		case p_name_ar = "p_name_ar"
		case p_logo = "p_logo"
		case p_detail = "p_detail"
		case p_detail_ar = "p_detail_ar"
		case p_type = "p_type"
		case p_contact = "p_contact"
		case p_email = "p_email"
		case p_website = "p_website"
		case p_image = "p_image"
		case p_status = "p_status"
		case p_created_at = "p_created_at"
		case event_organizer_id = "event_organizer_id"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		performer_id = try? values.decodeIfPresent(String.self, forKey: .performer_id)
		p_name = try? values.decodeIfPresent(String.self, forKey: .p_name)
		p_name_ar = try? values.decodeIfPresent(String.self, forKey: .p_name_ar)
		p_logo = try? values.decodeIfPresent(String.self, forKey: .p_logo)
		p_detail = try? values.decodeIfPresent(String.self, forKey: .p_detail)
		p_detail_ar = try? values.decodeIfPresent(String.self, forKey: .p_detail_ar)
		p_type = try? values.decodeIfPresent(String.self, forKey: .p_type)
		p_contact = try? values.decodeIfPresent(String.self, forKey: .p_contact)
		p_email = try? values.decodeIfPresent(String.self, forKey: .p_email)
		p_website = try? values.decodeIfPresent(String.self, forKey: .p_website)
		p_image = try? values.decodeIfPresent(String.self, forKey: .p_image)
		p_status = try? values.decodeIfPresent(String.self, forKey: .p_status)
		p_created_at = try? values.decodeIfPresent(String.self, forKey: .p_created_at)
		event_organizer_id = try? values.decodeIfPresent(String.self, forKey: .event_organizer_id)
	}

}
