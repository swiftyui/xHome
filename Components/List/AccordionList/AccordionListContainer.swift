//
//  AccordionEventListHeader.swift
//
//  Created by LW on 28/8/20.
//

import SwiftUI

struct AccordionListContainer<Content>: View where Content: View {
    var headTitle: String = "This is header"
    @Binding var expand: Bool
    var hideExpandButton = true

    var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            NavigationLink(destination: EmptyView(), label: {
                HStack {
                    Text(headTitle)
                        .font(.system(size: 11))
                        .foregroundColor(.white)
                    Spacer()
                    if !hideExpandButton {
                        Image(systemName: expand ? "minus.square" : "plus.square")
                            .font(.system(size: 11))
                            .foregroundColor(Color.white)
                            .onTapGesture {
                                withAnimation {
                                    self.expand.toggle()
                                }
                            }
                    }
                }
                .padding(.leading, 10)
            })

                .font(.headline)
                .frame(height: 35)
                .foregroundColor(.white)
                .background(Color.rgb(0x323232))

            if expand {
                content()
            }
        }
        .addBorder(Color.mainBorderColor, width: 1, cornerRadius: 4)
        .clipCornerRadius(4, corners: [.topLeft, .topRight])
    }
}

struct AccordionEventListHeader_Previews: PreviewProvider {
    static var previews: some View {
        let content =
            VStack(spacing: 0) {
                AccordionEventListRow(event: VAccordionListRowItem(id: "1", icon: "square", title: "event 1", timeLeft: 10, raceNumber: "10"))
                Divider()
                AccordionEventListRow(event: VAccordionListRowItem(id: "1", icon: "square", title: "event 1", timeLeft: 100, raceNumber: "100"))
            }

        return
            Group {
                // Section must be in List, so wrap it with List
                List {
                    AccordionListContainer(headTitle: "With list", expand: .constant(true)) {
                        content
                    }
                }
                AccordionListContainer(headTitle: "No list", expand: .constant(true), hideExpandButton: false) {
                    content
                }
            }
    }
}
