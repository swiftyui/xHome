//
//  AccordionEventList.swift
//
//  Created by LW on 28/8/20.
//

import SwiftUI
import UIKit

struct AccordionEventList: View {
    var dataModel: VAccordionList
    @State private var expand = true
    var body: some View {
        AccordionListContainer(headTitle: dataModel.title, expand: $expand, content: {
            ForEach(self.dataModel.items, id: \.self) { event in
                VStack(spacing: 0) {
                    Group {
                        AccordionEventListRow(event: event)
                        Divider()
                    }
                }
            }
        }).background(Color.rgb(0xF7F7F7))
    }
}
