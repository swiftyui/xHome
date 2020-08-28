//
//  AccordionEventListRow.swift
//
//  Created by LW on 28/8/20.
//

import SwiftUI

struct AccordionEventListRow: View {
    var event: VAccordionListRowItem
    var countdownSeconds: Int = -1

    var body: some View {
        NavigationLink(destination: EmptyView()) {
            HStack {
                Image.randomSystemImage()
                Text(event.title).font(.system(size: 11))
                Spacer()
                CountDownLabel(startWith: event.timeLeft)
                if event.raceNumber != nil {
                    CircleRaceNumberLabel(diameter: 20, title: event.raceNumber!)
                }
            }
        }
        .padding(10)
    }
}

struct AccordionEventListRow_Previews: PreviewProvider {
    static var previews: some View {
        let event = VAccordionListRowItem(id: "id", icon: "", title: "This is event name", timeLeft: 3000, raceNumber: "R3")
        return AccordionEventListRow(event: event).previewLayout(.fixed(width: 400, height: 44))
    }
}
