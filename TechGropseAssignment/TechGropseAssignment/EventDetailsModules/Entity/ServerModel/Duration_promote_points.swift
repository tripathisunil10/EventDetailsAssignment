
import Foundation
struct Duration_promote_points : Codable {
	let id : String?
	let views : String?
	let points : String?
	let type : String?
	let duration_status : String?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case views = "views"
		case points = "points"
		case type = "type"
		case duration_status = "duration_status"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try? values.decodeIfPresent(String.self, forKey: .id)
		views = try? values.decodeIfPresent(String.self, forKey: .views)
		points = try? values.decodeIfPresent(String.self, forKey: .points)
		type = try? values.decodeIfPresent(String.self, forKey: .type)
		duration_status = try? values.decodeIfPresent(String.self, forKey: .duration_status)
	}

}
