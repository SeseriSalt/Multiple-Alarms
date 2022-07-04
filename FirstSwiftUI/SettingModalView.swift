//
//  SettingModalView.swift
//  FirstSwiftUI
//
//  Created by 矢田翔大 on 2022/07/04.
//

import SwiftUI

struct SettingModalView: View {
    @Environment(\.presentationMode) var presentation
    @EnvironmentObject var userData: UserData
    @State var firstTimeDate = Date()
    @State var count = 1
    @State var interval = 5
    @FocusState var focus: Bool
    var body: some View {
        NavigationView{
            VStack{
                Form {
                    DatePicker("はじめの時刻", selection: $firstTimeDate,
                               displayedComponents: .hourAndMinute)
                    .padding()
//                   wheelさせたい
//                                .datePickerStyle(WheelPickerStyle())
                
                    HStack{
                        Text("スヌーズ回数")
                        TextField("", value: $count, formatter: NumberFormatter())
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.numberPad)
                            .padding(.leading, 80)
                            .focused(self.$focus)
                                            .toolbar{
                                                ToolbarItem(placement: .keyboard){
                                                    HStack{
                                                        Spacer()
                                                        Button("Close"){
                                                            self.focus = false
                                                        }
                                                    }
                                                }
                                            }
                        Text("回")
                    }
                    
                        .padding()
                    HStack{
                        Text("スヌーズ間隔")
                        TextField("", value: $interval, formatter: NumberFormatter())
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.numberPad)
                            .padding(.leading, 80)
                            .focused(self.$focus)
                                            .toolbar{
                                                ToolbarItem(placement: .keyboard){
                                                    HStack{
                                                        Spacer()
                                                        Button("Close"){
                                                            self.focus = false
                                                        }
                                                    }
                                                }
                                            }
                        Text("分")
                    }
        
                        .padding()
                    Button(action: {
                        createAlarmTask()
                        self.presentation.wrappedValue.dismiss()
                        
                    },label: {
                        Text("追加！")
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                    })

                
//                    .navigationTitle("アラームを追加")
                    .navigationBarItems(leading: Button(action: {
                        self.presentation.wrappedValue.dismiss()
                        
                    },label: {
                        Text("キャンセル")
                        
                    }))
                }
            }
        }
        
    }
    
    func createAlarmTask() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "H:m"
        let timeStr = dateFormatter.string(from: firstTimeDate)
        let newAlarm = AlarmTask(firstTime: timeStr, count: self.count, interval: self.interval)
        self.userData.alarmTasks.append(newAlarm)
//        self.userData.alarmTasks.sort{$0[0] > $1[0]}
//        ここでソートしたい
    }
}


struct SettingModalView_Previews: PreviewProvider {
    static var previews: some View {
        SettingModalView()
            .environmentObject(UserData())
    }
}
