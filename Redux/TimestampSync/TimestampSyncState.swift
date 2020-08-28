//
//  NextRaceState.swift
//  xHome
//
//  Created by liang wang on 26/8/20.
//


import Foundation
import SwiftUIFlux

struct TimestampSyncState: FluxState, Codable {
    
    // API response
    var timestampSyncResponse: APITimestampSyncResponse?
    
    // Fetch status
    var fetchingStatus: FetchingStatus = .initial
    
}
