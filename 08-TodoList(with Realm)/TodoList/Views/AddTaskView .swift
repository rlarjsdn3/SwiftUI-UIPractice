//
//  AddTaskView .swift
//  TodoList
//
//  Created by 김건우 on 2023/02/27.
//

import SwiftUI

struct AddTaskView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var realmManager: RealmManager
    @State private var title: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    Color(hue: 0.086, saturation: 0.141, brightness: 0.972)
                        .ignoresSafeArea()
                    
                    List {
                        Section {
                            TextField("Enter your task here", text: $title)
                        } header: {
                            Text("Task")
                        }
                    }
                    .listStyle(.inset)
                }
                
                Spacer()
                
                Button {
                    if !title.isEmpty {
                        realmManager.addTask(title: title)
                    }
                    dismiss()
                } label: {
                    Text("Add")
                        .frame(width: UIScreen.main.bounds.width * 0.8)
                        .padding()
                        .foregroundColor(.white)
                        .background(.red)
                        .cornerRadius(15)
                }

            }
            .navigationTitle("Create a new Task")
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(Color.red, for: .navigationBar)
            .interactiveDismissDisabled(title.count > 0)
        }
        
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
            .environmentObject(RealmManager())
    }
}
