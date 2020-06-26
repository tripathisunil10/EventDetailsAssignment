
import Foundation
struct EventData : Codable {
	let event_id : String?
	let ev_user_id : String?
	let ev_event_type : String?
	let ev_category_id : String?
	let ev_tag_id : String?
	let ev_venue_id : String?
	let ev_event_fee : String?
	let ev_is_public : String?
	let ev_featured : String?
	let ev_name : String?
	let ev_name_ar : String?
	let ev_title : String?
	let ev_title_ar : String?
	let ev_organizer_name : String?
	let ev_organizer_id : String?
	let ev_start_date : String?
	let ev_end_date : String?
	let ev_start_time : String?
	let ev_end_time : String?
	let ev_image : [Ev_image]?
	let ev_seating_map_image : [String]?
	let ev_vennue_name : String?
	let ev_vennue_name_ar : String?
	let ev_country : String?
	let ev_region : String?
	let ev_city : String?
	let ev_address : String?
	let ev_lat : String?
	let ev_long : String?
	let ev_gender : String?
	let ev_age_id : String?
	let ev_language : String?
	let ev_imp_notes : String?
	let ev_imp_notes_ar : String?
	let ev_description : String?
	let ev_description_ar : String?
	let ev_detail : String?
	let ev_detail_ar : String?
	let ev_email : String?
	let ev_contact : String?
	let ev_whatsapp_no : String?
	let ev_website : String?
	let ev_views : String?
	let ev_like : String?
	let ev_status : String?
	let ev_is_promoted : String?
	let ev_promote_country : String?
	let ev_promote_city : String?
	let ev_promoted_points : String?
	let ev_created_at : String?
	let ev_is_fav : String?
	let category_name : String?
	let category_color : String?
	let event_tag : [Event_tag]?
	let ev_users_points : String?
	let ev_country_id : String?
	let ev_city_id : String?
	let ev_region_id : String?
	let ev_country_points : String?
	let ev_region_points : String?
	let ev_city_points : String?
	let ev_event_type_name : String?
	let ev_reminder : String?
	let ev_is_reminder : String?
	let ev_new : String?
	let distance : String?
	let event_organizer : [Event_organizer]?
	let event_sponser : [Event_sponser]?
	let event_performer : [Event_performer]?
	let commentCount : String?
	let comment : [Comment]?
	let view_promote_points : [View_promote_points]?
	let duration_promote_points : [Duration_promote_points]?

	enum CodingKeys: String, CodingKey {

		case event_id = "event_id"
		case ev_user_id = "ev_user_id"
		case ev_event_type = "ev_event_type"
		case ev_category_id = "ev_category_id"
		case ev_tag_id = "ev_tag_id"
		case ev_venue_id = "ev_venue_id"
		case ev_event_fee = "ev_event_fee"
		case ev_is_public = "ev_is_public"
		case ev_featured = "ev_featured"
		case ev_name = "ev_name"
		case ev_name_ar = "ev_name_ar"
		case ev_title = "ev_title"
		case ev_title_ar = "ev_title_ar"
		case ev_organizer_name = "ev_organizer_name"
		case ev_organizer_id = "ev_organizer_id"
		case ev_start_date = "ev_start_date"
		case ev_end_date = "ev_end_date"
		case ev_start_time = "ev_start_time"
		case ev_end_time = "ev_end_time"
		case ev_image = "ev_image"
		case ev_seating_map_image = "ev_seating_map_image"
		case ev_vennue_name = "ev_vennue_name"
		case ev_vennue_name_ar = "ev_vennue_name_ar"
		case ev_country = "ev_country"
		case ev_region = "ev_region"
		case ev_city = "ev_city"
		case ev_address = "ev_address"
		case ev_lat = "ev_lat"
		case ev_long = "ev_long"
		case ev_gender = "ev_gender"
		case ev_age_id = "ev_age_id"
		case ev_language = "ev_language"
		case ev_imp_notes = "ev_imp_notes"
		case ev_imp_notes_ar = "ev_imp_notes_ar"
		case ev_description = "ev_description"
		case ev_description_ar = "ev_description_ar"
		case ev_detail = "ev_detail"
		case ev_detail_ar = "ev_detail_ar"
		case ev_email = "ev_email"
		case ev_contact = "ev_contact"
		case ev_whatsapp_no = "ev_whatsapp_no"
		case ev_website = "ev_website"
		case ev_views = "ev_views"
		case ev_like = "ev_like"
		case ev_status = "ev_status"
		case ev_is_promoted = "ev_is_promoted"
		case ev_promote_country = "ev_promote_country"
		case ev_promote_city = "ev_promote_city"
		case ev_promoted_points = "ev_promoted_points"
		case ev_created_at = "ev_created_at"
		case ev_is_fav = "ev_is_fav"
		case category_name = "category_name"
		case category_color = "category_color"
		case event_tag = "event_tag"
		case ev_users_points = "ev_users_points"
		case ev_country_id = "ev_country_id"
		case ev_city_id = "ev_city_id"
		case ev_region_id = "ev_region_id"
		case ev_country_points = "ev_country_points"
		case ev_region_points = "ev_region_points"
		case ev_city_points = "ev_city_points"
		case ev_event_type_name = "ev_event_type_name"
		case ev_reminder = "ev_reminder"
		case ev_is_reminder = "ev_is_reminder"
		case ev_new = "ev_new"
		case distance = "distance"
		case event_organizer = "event_organizer"
		case event_sponser = "event_sponser"
		case event_performer = "event_performer"
		case commentCount = "commentCount"
		case comment = "comment"
		case view_promote_points = "view_promote_points"
		case duration_promote_points = "duration_promote_points"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		event_id = try? values.decodeIfPresent(String.self, forKey: .event_id)
		ev_user_id = try? values.decodeIfPresent(String.self, forKey: .ev_user_id)
		ev_event_type = try? values.decodeIfPresent(String.self, forKey: .ev_event_type)
		ev_category_id = try? values.decodeIfPresent(String.self, forKey: .ev_category_id)
		ev_tag_id = try? values.decodeIfPresent(String.self, forKey: .ev_tag_id)
		ev_venue_id = try? values.decodeIfPresent(String.self, forKey: .ev_venue_id)
		ev_event_fee = try? values.decodeIfPresent(String.self, forKey: .ev_event_fee)
		ev_is_public = try? values.decodeIfPresent(String.self, forKey: .ev_is_public)
		ev_featured = try? values.decodeIfPresent(String.self, forKey: .ev_featured)
		ev_name = try? values.decodeIfPresent(String.self, forKey: .ev_name)
		ev_name_ar = try? values.decodeIfPresent(String.self, forKey: .ev_name_ar)
		ev_title = try? values.decodeIfPresent(String.self, forKey: .ev_title)
		ev_title_ar = try? values.decodeIfPresent(String.self, forKey: .ev_title_ar)
		ev_organizer_name = try? values.decodeIfPresent(String.self, forKey: .ev_organizer_name)
		ev_organizer_id = try? values.decodeIfPresent(String.self, forKey: .ev_organizer_id)
		ev_start_date = try? values.decodeIfPresent(String.self, forKey: .ev_start_date)
		ev_end_date = try? values.decodeIfPresent(String.self, forKey: .ev_end_date)
		ev_start_time = try? values.decodeIfPresent(String.self, forKey: .ev_start_time)
		ev_end_time = try? values.decodeIfPresent(String.self, forKey: .ev_end_time)
		ev_image = try? values.decodeIfPresent([Ev_image].self, forKey: .ev_image)
		ev_seating_map_image = try? values.decodeIfPresent([String].self, forKey: .ev_seating_map_image)
		ev_vennue_name = try? values.decodeIfPresent(String.self, forKey: .ev_vennue_name)
		ev_vennue_name_ar = try? values.decodeIfPresent(String.self, forKey: .ev_vennue_name_ar)
		ev_country = try? values.decodeIfPresent(String.self, forKey: .ev_country)
		ev_region = try? values.decodeIfPresent(String.self, forKey: .ev_region)
		ev_city = try? values.decodeIfPresent(String.self, forKey: .ev_city)
		ev_address = try? values.decodeIfPresent(String.self, forKey: .ev_address)
		ev_lat = try? values.decodeIfPresent(String.self, forKey: .ev_lat)
		ev_long = try? values.decodeIfPresent(String.self, forKey: .ev_long)
		ev_gender = try? values.decodeIfPresent(String.self, forKey: .ev_gender)
		ev_age_id = try? values.decodeIfPresent(String.self, forKey: .ev_age_id)
		ev_language = try? values.decodeIfPresent(String.self, forKey: .ev_language)
		ev_imp_notes = try? values.decodeIfPresent(String.self, forKey: .ev_imp_notes)
		ev_imp_notes_ar = try? values.decodeIfPresent(String.self, forKey: .ev_imp_notes_ar)
		ev_description = try? values.decodeIfPresent(String.self, forKey: .ev_description)
		ev_description_ar = try? values.decodeIfPresent(String.self, forKey: .ev_description_ar)
		ev_detail = try? values.decodeIfPresent(String.self, forKey: .ev_detail)
		ev_detail_ar = try? values.decodeIfPresent(String.self, forKey: .ev_detail_ar)
		ev_email = try? values.decodeIfPresent(String.self, forKey: .ev_email)
		ev_contact = try? values.decodeIfPresent(String.self, forKey: .ev_contact)
		ev_whatsapp_no = try? values.decodeIfPresent(String.self, forKey: .ev_whatsapp_no)
		ev_website = try? values.decodeIfPresent(String.self, forKey: .ev_website)
		ev_views = try? values.decodeIfPresent(String.self, forKey: .ev_views)
		ev_like = try? values.decodeIfPresent(String.self, forKey: .ev_like)
		ev_status = try? values.decodeIfPresent(String.self, forKey: .ev_status)
		ev_is_promoted = try? values.decodeIfPresent(String.self, forKey: .ev_is_promoted)
		ev_promote_country = try? values.decodeIfPresent(String.self, forKey: .ev_promote_country)
		ev_promote_city = try? values.decodeIfPresent(String.self, forKey: .ev_promote_city)
		ev_promoted_points = try? values.decodeIfPresent(String.self, forKey: .ev_promoted_points)
		ev_created_at = try? values.decodeIfPresent(String.self, forKey: .ev_created_at)
		ev_is_fav = try? values.decodeIfPresent(String.self, forKey: .ev_is_fav)
		category_name = try? values.decodeIfPresent(String.self, forKey: .category_name)
		category_color = try? values.decodeIfPresent(String.self, forKey: .category_color)
		event_tag = try? values.decodeIfPresent([Event_tag].self, forKey: .event_tag)
		ev_users_points = try? values.decodeIfPresent(String.self, forKey: .ev_users_points)
		ev_country_id = try? values.decodeIfPresent(String.self, forKey: .ev_country_id)
		ev_city_id = try? values.decodeIfPresent(String.self, forKey: .ev_city_id)
		ev_region_id = try? values.decodeIfPresent(String.self, forKey: .ev_region_id)
		ev_country_points = try? values.decodeIfPresent(String.self, forKey: .ev_country_points)
		ev_region_points = try? values.decodeIfPresent(String.self, forKey: .ev_region_points)
		ev_city_points = try? values.decodeIfPresent(String.self, forKey: .ev_city_points)
		ev_event_type_name = try? values.decodeIfPresent(String.self, forKey: .ev_event_type_name)
		ev_reminder = try? values.decodeIfPresent(String.self, forKey: .ev_reminder)
		ev_is_reminder = try? values.decodeIfPresent(String.self, forKey: .ev_is_reminder)
		ev_new = try? values.decodeIfPresent(String.self, forKey: .ev_new)
		distance = try? values.decodeIfPresent(String.self, forKey: .distance)
		event_organizer = try? values.decodeIfPresent([Event_organizer].self, forKey: .event_organizer)
		event_sponser = try? values.decodeIfPresent([Event_sponser].self, forKey: .event_sponser)
		event_performer = try? values.decodeIfPresent([Event_performer].self, forKey: .event_performer)
		commentCount = try? values.decodeIfPresent(String.self, forKey: .commentCount)
		comment = try? values.decodeIfPresent([Comment].self, forKey: .comment)
		view_promote_points = try? values.decodeIfPresent([View_promote_points].self, forKey: .view_promote_points)
		duration_promote_points = try? values.decodeIfPresent([Duration_promote_points].self, forKey: .duration_promote_points)
	}

}
