//
//  ContentView.swift
//  FirstSwiftUI
//
//  Created by 矢田翔大 on 2022/07/02.
//

import SwiftUI

var DateArr:[String] = []
var TimesArr:[Int] = []
var IntervalArr:[Int] = []
struct ContentView: View {
    var body: some View {
        TabView {
            AlarmListView()
                .tabItem {
                    Image(systemName: "alarm")
                    Text("アラームリスト")
                }
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
    let fruits = ["りんご", "みかん", "スイカ", "レモン"]
    var body: some View {
        NavigationView {
            VStack{
                List {
                    HStack {
                        Toggle("13:00から5分おきに３回", isOn: $OnOff)
                            .padding(.leading, 10)
                            .font(.title2)
                            
                    }
                    HStack {
                        Toggle("時間", isOn: $OnOff)
                    }
                    HStack {
                        Toggle("時間", isOn: $OnOff)
                    }
                    ForEach(fruits, id: \.self) { fruit in
                                    Text(fruit)
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
                    ModalView()
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


struct ModalView: View {
    @Environment(\.presentationMode) var presentation
    @State private var selectionDate = Date()
    @State var times = 1
    @State var interval = 5
    @FocusState var focus:Bool
    var body: some View {
        NavigationView{
            VStack{
                Form {
                    DatePicker("はじめの時刻", selection: $selectionDate,
                               displayedComponents: .hourAndMinute)
                    .padding()
//                   wheelさせたい
//                                .datePickerStyle(WheelPickerStyle())
                
                    HStack{
                        Text("スヌーズ回数")
                        TextField("", value: $times, formatter: NumberFormatter())
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
                        TimesArr.append(times)
                        IntervalArr.append(interval)
                        DateArr.append("\(selectionDate)")
                        print(DateArr)
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
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView()
    }
}
