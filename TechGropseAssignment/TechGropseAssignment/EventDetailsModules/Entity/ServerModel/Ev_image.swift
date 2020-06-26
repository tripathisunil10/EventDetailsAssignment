
import Foundation
struct Ev_image : Codable {
	let image : String?

	enum CodingKeys: String, CodingKey {

		case image = "image"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		image = try? values.decodeIfPresent(String.self, forKey: .image)
	}

}
