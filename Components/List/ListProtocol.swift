//
//  ListProtocolo.swift
//
//  Created by LW on 28/8/20.
//

import Foundation

protocol VList: Hashable, Codable, Identifiable {
    associatedtype T: VListRowItem
    var title: String { get set }
    var id: String { get set }
    var icon: String { get set }
    var items: [T] { get set }
}

protocol VListRowItem: Hashable, Codable, Identifiable {
    var id: String { get set }
    var icon: String { get set }
    var title: String { get set }
    var timeLeft: Int { get set }
    var raceNumber: String? { get set }
}
