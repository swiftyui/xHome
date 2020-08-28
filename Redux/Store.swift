//
//  Store.swift
//  xHome
//
//  Created by liang wang on 26/8/20.
//

import Foundation
import SwiftUIFlux

let store = Store<AppState>(reducer: appStateReducer,
                            middleware: [],
                            state: AppState())

struct AppState: FluxState, Codable {
    // Always provide a default value
    var nextRacesState: NextRacesState = NextRacesState()
    var timestampSyncState: TimestampSyncState = TimestampSyncState()
    
    var bootStrapFinished: Bool {
        (nextRacesState.fetchingStatus == .failure || nextRacesState.fetchingStatus == .success) &&
            (timestampSyncState.fetchingStatus == .failure || timestampSyncState.fetchingStatus == .success)
    }
}

func appStateReducer(state: AppState, action: Action) -> AppState {
    var state = state
    switch action.id {
    case NextRacesActions.actionId:
        state.nextRacesState = nextRacesStateReducer(state: state.nextRacesState, action: action)
    case TimestampSyncActions.actionId:
        state.timestampSyncState = timestampSyncStateReducer(state: state.timestampSyncState, action: action)
    default:
        print("do nothing")
    }
    return state
}
