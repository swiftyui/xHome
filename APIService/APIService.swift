//
//  Created by LW on 28/8/20.
//

import Foundation
import Moya

enum APIService {
    case getNextRaces
    case getTimestampSync
}

extension APIService: TargetType {
    var baseURL: URL { URL(string: "https://api.ladbrokes.com.au")! }
    var path: String {
        switch self {
        case .getNextRaces:
            return "/v2/racing/next-races-category-group"
        case .getTimestampSync:
            return "/insights/sync"
        }
    }

    var method: Moya.Method {
        switch self {
        case .getNextRaces:
            return .get
        case .getTimestampSync:
            return .post
        }
    }

    var task: Task {
        switch self {
        case .getNextRaces:
            let categories = ["4a2788f8-e825-4d36-9894-efd4baf1cfae", "9daef0d7-bf3c-4f50-921d-8e818c60fe61", "161d9be2-e909-4326-8c2c-35ed71fb460b"]
            return .requestParameters(parameters: ["count": 5, "categories": categories], encoding: URLEncoding.queryString)
        case .getTimestampSync:
            return .requestPlain
        }
    }

    var sampleData: Data {
        switch self {
        case .getNextRaces:
            return "Next Race Demo.".utf8Encoded
        case .getTimestampSync:
            return "Timestamp Sync Demo".utf8Encoded
        }
    }

    var headers: [String: String]? {
        ["Content-type": "application/json"]
    }
}

// MARK: - Helpers

private extension String {
    var urlEscaped: String {
        addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }

    var utf8Encoded: Data {
        data(using: .utf8)!
    }
}
