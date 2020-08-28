//
//  NextRaceReducers.swift
//  xHome
//
//  Created by liang wang on 26/8/20.
//

import Foundation
import SwiftUIFlux

func timestampSyncStateReducer(state: TimestampSyncState, action: Action) -> TimestampSyncState {
    var state = state
    switch action {
    case let action as TimestampSyncActions.FetchTimestampSyncDoneAction:
        switch action.result {
        case .success(let response):
            state.timestampSyncResponse = response
        default:
            state.timestampSyncResponse = nil
        }
        state.fetchingStatus = action.fetchingStatus
        
    default:
        break
    }
    
    return state
}


