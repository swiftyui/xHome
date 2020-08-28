//
//  NextRaceRootView.swift
//  xHome
//
//  Created by liang wang on 23/8/20.
//

import SwiftUI
import SwiftUIFlux

struct NTGRootView: View {
    @EnvironmentObject var store: Store<AppState>
    var body: some View {
        VStack {
            AccordionEventList(dataModel: getAccordionList(categoryId: HORSE_CATEGORY_ID))
            AccordionEventList(dataModel: getAccordionList(categoryId: GREYHOUND_CATEGORY_ID))
            AccordionEventList(dataModel: getAccordionList(categoryId: HARNESS_CATEGORY_ID))
            Spacer()
        }
    }
}

extension NTGRootView {
    var nextRaceDataModel: APINextRaceResponse? {
        store.state.nextRacesState.nextRacesResponse
    }
    
    private func getDateModelFor(categoryId: String) -> [MNextRaceSummary] {
        if let ids = nextRaceDataModel?.category_race_map?[categoryId]?.race_ids,
            let summaries = nextRaceDataModel?.race_summaries {
            return ids.compactMap { (id) -> MNextRaceSummary? in
                summaries[id] ?? nil
            }
        }
        return []
    }
    
    private func getAccordionList(categoryId: String) -> VAccordionList {
        let data = getDateModelFor(categoryId: categoryId)
        let items: [VAccordionListRowItem] = data.map { (raceSummary) -> VAccordionListRowItem in
            var timeLeft = 0;
            if let advertisedStart = raceSummary.advertised_start {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
                timeLeft = Int(dateFormatter.date(from: advertisedStart)?.timeIntervalSince(Date()) ?? 0)
            }
            
            return VAccordionListRowItem(
                id: raceSummary.meeting_id!, icon: "df", title: raceSummary.meeting_name!, timeLeft: timeLeft, raceNumber: "\(raceSummary.race_number!)"
            )
        }
        var title = ""
        var iconName = ""
        switch categoryId {
        case HORSE_CATEGORY_ID:
            title = "Horsing"
            iconName = "horsing"
        case HORSE_CATEGORY_ID:
            title = "Greyhound"
            iconName = "greyhound"
        case HORSE_CATEGORY_ID:
            title = "Harness"
            iconName = "harness"
        default: break
        }
        return VAccordionList(title: title, id: categoryId, icon: iconName, items: items)
    }
}

struct NTGRootView_Previews: PreviewProvider {
    static var previews: some View {
        NTGRootView()
    }
}
