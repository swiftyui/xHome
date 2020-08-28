//
//  Model.swift
//  xHome
//
//  Created by liang wang on 23/8/20.
//

import Foundation

struct MDistanceType: Codable {
    let name: String?
    let short_name: String?
}

struct MTrackCondition: Codable {
    let name: String?
    let short_name: String?
}

struct MWeather: Codable {
    let name: String?
}

struct MRaceForm: Codable {
    let additional_data: String?
    let distance: Int?
    let distance_type: MDistanceType?
    let race_comment: String?
    let track_condition: MTrackCondition?
    let weather: MWeather?
}

struct MNextRaceSummary: Codable {
    let advertised_start: String?
    let category_id: String?
    let meeting_id: String?
    let meeting_name: String?
    let race_form: MRaceForm?
    let race_id: String?
    let race_name: String?
    let race_number: Int?
    let venue_country: String?
    let venue_id: String?
    let venue_name: String?
    let venue_state: String?
}

struct MCateogryRace: Codable {
    let race_ids: [String]?
}

struct APINextRaceResponse: Codable {
    let category_race_map: [String: MCateogryRace]?
    var race_summaries: [String: MNextRaceSummary]?
    
    var fetchingStatus: FetchingStatus? = .initial
}

struct APITimestampSyncResponse: Codable {
    let timestamp: Int
}
