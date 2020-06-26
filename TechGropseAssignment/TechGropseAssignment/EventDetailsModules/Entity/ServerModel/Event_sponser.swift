

import Foundation
struct Event_sponser : Codable {
	let sponsor_id : String?
	let s_name : String?
	let s_name_ar : String?
	let s_logo : String?
	let s_detail : String?
	let s_detail_ar : String?
	let s_contact : String?
	let s_type : String?
	let s_email : String?
	let s_website : String?
	let s_image : String?
	let s_status : String?
	let s_created_at : String?
	let event_organizer_id : String?

	enum CodingKeys: String, CodingKey {

		case sponsor_id = "sponsor_id"
		case s_name = "s_name"
		case s_name_ar = "s_name_ar"
		case s_logo = "s_logo"
		case s_detail = "s_detail"
		case s_detail_ar = "s_detail_ar"
		case s_contact = "s_contact"
		case s_type = "s_type"
		case s_email = "s_email"
		case s_website = "s_website"
		case s_image = "s_image"
		case s_status = "s_status"
		case s_created_at = "s_created_at"
		case event_organizer_id = "event_organizer_id"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		sponsor_id = try? values.decodeIfPresent(String.self, forKey: .sponsor_id)
		s_name = try? values.decodeIfPresent(String.self, forKey: .s_name)
		s_name_ar = try? values.decodeIfPresent(String.self, forKey: .s_name_ar)
		s_logo = try? values.decodeIfPresent(String.self, forKey: .s_logo)
		s_detail = try? values.decodeIfPresent(String.self, forKey: .s_detail)
		s_detail_ar = try? values.decodeIfPresent(String.self, forKey: .s_detail_ar)
		s_contact = try? values.decodeIfPresent(String.self, forKey: .s_contact)
		s_type = try? values.decodeIfPresent(String.self, forKey: .s_type)
		s_email = try? values.decodeIfPresent(String.self, forKey: .s_email)
		s_website = try? values.decodeIfPresent(String.self, forKey: .s_website)
		s_image = try? values.decodeIfPresent(String.self, forKey: .s_image)
		s_status = try? values.decodeIfPresent(String.self, forKey: .s_status)
		s_created_at = try? values.decodeIfPresent(String.self, forKey: .s_created_at)
		event_organizer_id = try? values.decodeIfPresent(String.self, forKey: .event_organizer_id)
	}

}
