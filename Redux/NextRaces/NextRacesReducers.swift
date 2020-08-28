//
//  NextRaceReducers.swift
//  xHome
//
//  Created by liang wang on 26/8/20.
//

import Foundation
import SwiftUIFlux

func nextRacesStateReducer(state: NextRacesState, action: Action) -> NextRacesState {
    var state = state
    switch action {
    case let action as NextRacesActions.FetchNextRacesDoneAction:
        switch action.result {
        case .success(let response):
            state.nextRacesResponse = response
        default:
            state.nextRacesResponse = nil
        }
        state.fetchingStatus = action.fetchingStatus
        
    default:
        break
    }
    
    return state
}


