//
//  ContentView.swift
//  xHome
//
//  Created by liang wang on 23/8/20.
//

import Combine
import SwiftUI
import SwiftUIFlux

struct ContentView: View {
    @EnvironmentObject var store: Store<AppState>

    var bootstrapFinished: Bool {
        store.state.bootStrapFinished
    }

    var body: some View {
        ZStack {
            NTGRootView()
            SplashScreen()
                .opacity(bootstrapFinished ? 0 : 1)
                .onAppear {
                    runBootstrap()
                }
        }
    }
}

extension ContentView {
    private func runBootstrap() {
        store.dispatch(action: NextRacesActions.FetchNextRacesAction())
        store.dispatch(action: TimestampSyncActions.FetchTimestampSyncAction())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
