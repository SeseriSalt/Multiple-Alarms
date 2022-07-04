//
//  UsesrData.swift
//  FirstSwiftUI
//
//  Created by 矢田翔大 on 2022/07/04.
//

import SwiftUI

class UserData: ObservableObject {
    @Published var alarmTasks = [
        AlarmTask(firstTime: "13:00", count: 3, interval: 5),
        AlarmTask(firstTime: "14:00", count: 6, interval: 10)
    ]
}
