//
//  NextRaceAction.swift
//  xHome
//
//  Created by liang wang on 26/8/20.
//

import Foundation
import SwiftUIFlux
import Moya
import SwiftyJSON


struct TimestampSyncActions {
    
    static let actionId = "TimestampSyncActions"
    
    struct FetchTimestampSyncAction: AsyncAction {
        var id = TimestampSyncActions.actionId

        func execute(state: FluxState?, dispatch: @escaping DispatchFunction) {
            let provider = MoyaProvider<APIService>()
            provider.request(.getTimestampSync) { result in
                switch result {
                case let .success(moyaResponse):
                    do {
                        // Convenient for debugging
                        let data = moyaResponse.data
                        let json = try JSON(data: data)
                        print(json)

                        let filteredResponse = try moyaResponse.filterSuccessfulStatusCodes()
                        let timestamp = try! filteredResponse.map(APITimestampSyncResponse.self)
                        
                        dispatch(FetchTimestampSyncDoneAction(result: .success(timestamp), fetchingStatus: .success))
                    } catch {
                        dispatch(FetchTimestampSyncDoneAction(result: .failure(error as! MoyaError), fetchingStatus: .failure))
                    }
                case let .failure(error):
                    dispatch(FetchTimestampSyncDoneAction(result: .failure(error), fetchingStatus: .failure))
                }
            }
        }
    }
    
    struct FetchTimestampSyncDoneAction: Action {
        var id = TimestampSyncActions.actionId
        let result: Result<APITimestampSyncResponse, MoyaError>
        var fetchingStatus: FetchingStatus
    }
}
