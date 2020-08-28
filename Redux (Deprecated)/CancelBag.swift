//
//  CancelBag.swift
//  xHome
//
//  Created by liang wang on 25/8/20.
//

import Combine
import Foundation

// MARK: - Cancel bag

class CancelBag {
    var subscriptions = Set<AnyCancellable>()

    func cancel() {
        subscriptions.forEach { $0.cancel() }
        subscriptions.removeAll()
    }
}

extension AnyCancellable {
    func store(in cancelBag: CancelBag) {
        cancelBag.subscriptions.insert(self)
    }
}
