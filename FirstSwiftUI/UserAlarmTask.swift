//
//  UserAlarmTask.swift
//  FirstSwiftUI
//
//  Created by 矢田翔大 on 2022/07/04.
//

import SwiftUI

struct AlarmTask: Identifiable {
    let id = UUID()
    var firstTime: String
    var count: Int
    var interval: Int
    
    init(firstTime: String, count: Int, interval: Int) {
        self.firstTime = firstTime
        self.count = count
        self.interval = interval
    }
    
}
