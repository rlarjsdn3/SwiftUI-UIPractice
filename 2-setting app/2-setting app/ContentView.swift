//
//  ContentView.swift
//  2-setting app
//
//  Created by 김건우 on 2023/01/06.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText: String = ""
    
    @State private var airplaneMode: Bool = false
    @State private var vpnMode: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    NavigationLink {
                        Text("사용자 뷰")
                    } label: {
                        navigationProfileCell()
                    }
                }
                
                Section {
                    navigationToggleCell(systemImage: "airplane", iconColor: .orange, title: "에어플레인 모드", binding: $airplaneMode)
                    
                    navigationPlainCell(systemImage: "wifi", iconColor: .blue, title: "Wi-Fi", subtitle: "iptime") {
                        Text("Wi-Fi 뷰")
                    }
                    
                    navigationPlainCell(systemImage: "wave.3.right.circle.fill", iconColor: .blue, title: "Bluetooth", subtitle: "끔") {
                        Text("Bluetooth 뷰")
                    }
                    
                    navigationPlainCell(systemImage: "antenna.radiowaves.left.and.right", iconColor: .green, title: "셀룰러") {
                        Text("셀룰러 뷰")
                    }
                    
                    navigationPlainCell(systemImage: "personalhotspot", iconColor: .green, title: "개인용 핫스팟") {
                        Text("개인용 핫스팟 뷰")
                    }
                    
                    navigationToggleCell(systemImage: "network", iconColor: .blue, title: "VPN", binding: $vpnMode)
                }
                
                Section {
                    navigationPlainCell(systemImage: "bell.badge.fill", iconColor: .red, title: "알림") {
                        Text("알림 뷰")
                    }
                    
                    navigationPlainCell(systemImage: "speaker.wave.3.fill", iconColor: .red, title: "사운드 및 햅틱") {
                        Text("사운드 및 햅틱 뷰")
                    }
                    
                    navigationPlainCell(systemImage: "moon.fill", iconColor: .indigo, title: "집중 모드") {
                        Text("집중 모드 뷰")
                    }
                    
                    navigationPlainCell(systemImage: "hourglass", iconColor: .indigo, title: "스크린 타임") {
                        Text("스크린 타임 뷰")
                    }
                }
                
                Section {
                    navigationPlainCell(systemImage: "gear", iconColor: .gray, title: "일반") {
                        Text("일반 뷰")
                    }
                    
                    navigationPlainCell(systemImage: "textformat.size", iconColor: .blue, title: "디스플레이 및 밝기") {
                        Text("디스플레이 및 밝기 뷰")
                    }
                    
                    navigationPlainCell(systemImage: "battery.100", iconColor: .green, title: "배터리") {
                        Text("배터리 뷰")
                    }
                }
                
                Section {
                    navigationPlainCell(systemImage: "key.fill", iconColor: .gray, title: "암호") {
                        Text("암호 뷰")
                    }
                }
            }
            .navigationTitle("설정")
            .searchable(text: $searchText, prompt: "검색")
        }
    }
    
    @ViewBuilder
    private func navigationProfileCell() -> some View {
        HStack {
            profileImageView()
                .frame(width: 80, height: 80)
                .padding(.vertical, -12)
                .padding(.horizontal, -15)
                .padding(.leading, -3)
            
            VStack(alignment: .leading, spacing: 0) {
                Text("김건우")
                    .font(.system(.title3, design: .default, weight: .semibold))
                Text("Apple ID, iCloud, 미디어 및 구입 항목")
                    .font(.footnote)
            }
            .padding(.leading, 7)
        }
        .padding(.vertical, -5)
    }
    
    @ViewBuilder
    private func cellImage(systemImage: String, iconColor: Color) -> some View {
        Image(systemName: systemImage)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 18, height: 18)
            .padding(4)
            .background(iconColor)
            .foregroundColor(.white)
            .cornerRadius(7)
            .padding(.leading, -8)
            .padding(.trailing, 8)
    }
    
    @ViewBuilder
    private func navigationPlainCell(systemImage: String, iconColor: Color, title: String, subtitle: String? = nil, destination: @escaping () -> some View) -> some View {
        HStack {
            cellImage(systemImage: systemImage, iconColor: iconColor)
            
            if let subtitle: String = subtitle {
                NavigationLink {
                    destination()
                } label: {
                    HStack {
                        Text(title)
                        Spacer()
                        Text(subtitle)
                            .foregroundColor(.gray)
                    }
                }
            } else {
                NavigationLink(title) {
                    destination()
                }
            }
        }
    }
    
    @ViewBuilder
    private func navigationToggleCell(systemImage: String, iconColor: Color, title: String, binding: Binding<Bool>) -> some View {
        HStack {
            cellImage(systemImage: systemImage, iconColor: iconColor)
            
            Toggle(title, isOn: binding)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
