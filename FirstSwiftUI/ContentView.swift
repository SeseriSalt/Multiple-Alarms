//
//  ContentView.swift
//  FirstSwiftUI
//
//  Created by 矢田翔大 on 2022/07/02.
//

import SwiftUI

//var DateArr:[String] = []
//var TimesArr:[Int] = []
//var IntervalArr:[Int] = []



struct ContentView: View {
    var body: some View {
        TabView {
            AlarmListView()
                .tabItem {
                    Image(systemName: "alarm")
                    Text("アラームリスト")
                }
//                .environmentObject(UserDeta())
            SettignView()
                .tabItem {
                    Image(systemName: "slider.horizontal.3")
                    Text("設定")
                }
        }
    }
}


struct AlarmListView: View {
    @State var OnOff: Bool = true
    @State private var showingModal = false
    @EnvironmentObject var userData: UserData
    var body: some View {
        NavigationView {
            VStack{
                List {
                    ForEach(userData.alarmTasks) { task in
                        ListRow(firstTime: task.firstTime, count: task.count, interval: task.interval)
                    }
                    .onDelete { (offsets) in
                        userData.alarmTasks.remove(atOffsets: offsets)
                    }
                
                }
                .font(.title)
            }
            .navigationTitle("Alarmlist")
            .navigationBarItems(leading: Button(action: {
                print("編集ボタンが押されました。")
            }, label: {
                Text("編集")
            }), trailing: HStack {
                Button(action: {
                    print("追加ボタンが押されました。")
                    self.showingModal.toggle()
                    
                }) {
                    Image(systemName: "plus")
                    Text("追加")
                }.sheet(isPresented: $showingModal) {
                    SettingModalView()
                }
            })
        }
    }
}



struct SettignView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Text("あああ")
            }
            .navigationTitle("Setting")
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserData())
    }
}


