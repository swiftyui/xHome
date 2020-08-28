/*
 See LICENSE folder for this sample’s licensing information.

 Abstract:
 The model for an individual landmark.
 */

import CoreLocation
import SwiftUI

struct VAccordionList: VList {
    var title: String = ""
    var id: String = ""
    var icon: String = ""
    var items: [VAccordionListRowItem] = []
}

struct VAccordionListRowItem: VListRowItem {
    var id: String = ""
    var icon: String = ""
    var title: String = ""
    var timeLeft: Int = 100
    var raceNumber: String? = ""
}
