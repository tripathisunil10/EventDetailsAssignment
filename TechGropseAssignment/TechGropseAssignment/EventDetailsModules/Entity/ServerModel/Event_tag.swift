

import Foundation
struct Event_tag : Codable {
	let et_id : String?
	let et_name_en : String?
	let et_color : String?

	enum CodingKeys: String, CodingKey {

		case et_id = "et_id"
		case et_name_en = "et_name_en"
		case et_color = "et_color"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		et_id = try? values.decodeIfPresent(String.self, forKey: .et_id)
		et_name_en = try? values.decodeIfPresent(String.self, forKey: .et_name_en)
		et_color = try? values.decodeIfPresent(String.self, forKey: .et_color)
	}

}
