//
//  CountDownLabel.swift
//
//  Created by LW on 28/8/20.
//

import SwiftUI

struct CountDownLabel: View {
    var prefixString = ""
    var startWith: Int
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    @State private var countdownSeconds: Int = 0

    private var countdownString: String {
        Format.COUNTDOWN(totalSeconds: countdownSeconds)
    }

    var body: some View {
        Text(countdownString).onReceive(timer) { _ in
            print(timer)
            self.countdownSeconds -= 1
        }
        .font(.system(size: 11))
        .frame(minWidth: 40, alignment: .leading)
        .onAppear {
            self.countdownSeconds = self.startWith
        }
    }
}

struct CountDownLabel_Previews: PreviewProvider {
    static var previews: some View {
        // TODO: preview countdown not working
        Group {
            CountDownLabel(startWith: 500)
        }.previewLayout(.fixed(width: 400, height: 100))
    }
}
