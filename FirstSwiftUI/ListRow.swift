//
//  ListRow.swift
//  FirstSwiftUI
//
//  Created by 矢田翔大 on 2022/07/04.
//

import SwiftUI

struct ListRow: View {
    @State var isSetAlarm: Bool = true
    @Environment(\.colorScheme) var colorScheme
    var firstTime: String
    var count: Int
    var interval: Int
    var body: some View {
        HStack {
            Toggle(isOn: $isSetAlarm) {
                Text("\(firstTime)から\(interval)分おきに\(count)回")
                    .font(.title2)
//                    .fontWeight(isSetAlarm ? .bold : .light)
                    .foregroundColor(colorScheme == .dark ? (isSetAlarm ? .white : .gray) : (isSetAlarm ? .black : .gray))
                    .padding(.leading, 10)
            }

        }
    }
}

struct ListRow_Previews: PreviewProvider {
    static var previews: some View {
        ListRow(firstTime: "13:00", count: 1, interval: 1)
            .environmentObject(UserData())
    }
}
