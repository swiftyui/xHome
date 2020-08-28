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


struct NextRacesActions {
    
    static let actionId = "NextRaceActions"
    
    struct FetchNextRacesAction: AsyncAction {
        var id = NextRacesActions.actionId

        func execute(state: FluxState?, dispatch: @escaping DispatchFunction) {
            let provider = MoyaProvider<APIService>()
            provider.request(.getNextRaces) { result in
                switch result {
                case let .success(moyaResponse):
                    do {
                        // Convenient for debugging
                        let data = moyaResponse.data
                        let json = try JSON(data: data)
                        print(json)

                        let filteredResponse = try moyaResponse.filterSuccessfulStatusCodes()
                        let races = try! filteredResponse.map(APINextRaceResponse.self)
                        
                        dispatch(FetchNextRacesDoneAction(result: .success(races), fetchingStatus: .success))
                    } catch {
                        dispatch(FetchNextRacesDoneAction(result: .failure(error as! MoyaError), fetchingStatus: .failure))
                    }
                case let .failure(error):
                    dispatch(FetchNextRacesDoneAction(result: .failure(error), fetchingStatus: .failure))
                }
            }
        }
    }
    
    struct FetchNextRacesDoneAction: Action {
        var id = NextRacesActions.actionId
        let result: Result<APINextRaceResponse, MoyaError>
        var fetchingStatus: FetchingStatus
    }
}
