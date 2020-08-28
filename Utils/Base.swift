//
//  Base.swift
//
//  Created by LW on 28/8/20.
//

import Foundation

protocol PMock {
    associatedtype DemoReturnType
    static func getMock() -> DemoReturnType
}
