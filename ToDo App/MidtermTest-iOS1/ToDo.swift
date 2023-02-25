//
//  ToDo.swift
//

import Foundation


class ToDo {
    var title: String
    var isUrgent: Bool

    init(t: String, isUrgent: Bool = false) {
        self.title = t
        self.isUrgent = isUrgent
    }
}
