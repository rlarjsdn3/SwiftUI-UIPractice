//
//  DetailEditView.swift
//  Scrumdiger
//
//  Created by 김건우 on 2023/01/31.
//

import SwiftUI

struct DetailEditView: View {
    @Binding var data: DailyScrum.Data
    @State private var newAttendeeName = ""
    
    var body: some View {
        Form {
            Section {
                TextField("Title", text: $data.title)
                HStack {
                    Slider(value: $data.lengthInMinutes, in: 5...30, step: 1) {
                        Text("Length")
                    }
                    .accessibilityValue("\(Int(data.lengthInMinutes)) minutes")
                    Spacer()
                    Text("\(Int(data.lengthInMinutes)) minutes")
                        .accessibilityHidden(true)
                }
                ThemePicker(selection: $data.theme)
            } header: {
                Text("Meeting Info")
            }

            Section {
                ForEach(data.attendees) { attendee in
                    Text(attendee.name)
                }
                .onDelete { indices in
                    data.attendees.remove(atOffsets: indices)
                }
            } header: {
                Text("Attendees")
            }
            HStack {
                TextField("New Attendee", text: $newAttendeeName)
                Button(action: {
                    withAnimation {
                        let attenddee = DailyScrum.Attendee(name: newAttendeeName)
                        data.attendees.append(attenddee)
                    }
                    newAttendeeName = ""
                }) {
                    Image(systemName: "plus.circle.fill")
                        .accessibilityLabel("Add attendee")
                }
                .disabled(newAttendeeName.isEmpty)
            }
        }
    }
}

struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView(data: .constant(DailyScrum.sampleData[0].data))
    }
}
