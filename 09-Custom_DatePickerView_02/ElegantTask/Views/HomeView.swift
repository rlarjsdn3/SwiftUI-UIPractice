//
//  HomeView.swift
//  ElegantTask
//
//  Created by 김건우 on 2023/03/01.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var taskViewModel: TaskViewModel
    
    @State private var date = Date()
    @State private var showTaskAddView = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 15) {
                CustomDatePickerView(selection: $date)
                    .padding(.top, 15)
                
                Divider()
                
                HStack {
                    Text("Tasks")
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer()
                    
                    Button {
                        showTaskAddView = true
                    } label: {
                        Image(systemName: "plus")
                    }
                    .buttonStyle(.calendarButtonStyle)

                }
                .padding(.horizontal)
                
                ScrollView(showsIndicators: false) {
                    TaskListView(date: $date)
                        .padding(.top, -10)
                        .padding()
                }
            }
            .navigationTitle("TodoList")
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(Color.orange.opacity(0.8), for: .navigationBar)
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $showTaskAddView) {
                TaskAddView()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(TaskViewModel())
    }
}
