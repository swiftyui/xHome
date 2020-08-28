//
//  Store.swift
//  xHome
//
//  Created by liang wang on 23/8/20.
//

import Combine
import Foundation
import Moya
import SwiftyJSON

#if USE_LEGACY_REDUX

    protocol AppDispatch {
        func execute(in store: AppStore)
    }

    // MARK: action

    enum AppAction {
        case getNextRaces
        case getBootstrapDone(result: Result<APINextRaceResponse, MoyaError>)
    }

    // MARK: state

    struct AppState: Codable {
        var nextRacesResponse: APINextRaceResponse?
        var nextRacesFetchingStatus: FetchingStatus = .initial
    }

    // MARK: store

    class AppStore: ObservableObject {
        @Published var appState = AppState()

        private var cancelBag = CancelBag()

        func dispatch(_ action: AppAction) {
            let (state, dispatch) = AppStore.reduce(state: appState, action: action)
            appState = state

            if dispatch != nil {
                dispatch!.execute(in: self)
            }
        }
    }

    extension AppStore {
        static func reduce(state: AppState, action: AppAction) -> (AppState, AppDispatch?) {
            var appState = state
            var appDispatch: AppDispatch?

            switch action {
            case .getNextRaces:
                appDispatch = NextRaceDispatch()
            case let .getBootstrapDone(result: result):
                switch result {
                case let .success(races):
                    appState.nextRacesResponse = races
                    appState.nextRacesFetchingStatus = .success
                case let .failure(error):
                    print("getBootstrapDone API request: \(error)")
                    appState.nextRacesFetchingStatus = .failure
                    appState.nextRacesResponse = nil
                }
            }
            return (appState, appDispatch)
        }
    }

    // dispatch

    struct NextRaceDispatch: AppDispatch {
        func execute(in store: AppStore) {
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

                        store.dispatch(.getBootstrapDone(result: .success(races)))
                    } catch {
                        print("getBootstrap API request: \(error)")
                        store.dispatch(.getBootstrapDone(result: .failure(error as! MoyaError)))
                    }
                case let .failure(error):
                    store.dispatch(.getBootstrapDone(result: .failure(error)))
                }
            }
        }
    }

#endif
