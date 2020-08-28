//
//  NextRaceState.swift
//  xHome
//
//  Created by liang wang on 26/8/20.
//


import Foundation
import SwiftUIFlux

struct NextRacesState: FluxState, Codable {
    
    // API response
    var nextRacesResponse: APINextRaceResponse?
    
    // Fetch status
    var fetchingStatus: FetchingStatus = .initial
    
}
