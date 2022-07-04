//
//  FirstSwiftUIApp.swift
//  FirstSwiftUI
//
//  Created by 矢田翔大 on 2022/07/02.
//

import SwiftUI

@main
struct FirstSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(UserData())
        }
    }
}
