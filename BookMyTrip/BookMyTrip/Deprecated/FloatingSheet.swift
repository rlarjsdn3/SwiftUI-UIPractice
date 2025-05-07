//
//  FloatingSheet.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/3/25.
//

import SwiftUI

@available(*, deprecated, renamed: "BottomSheet")
struct FloatingSheet<Content>: View where Content: View {

    @Environment(\.dismiss) var dismiss: DismissAction

    let label: String?
    let content: () -> Content

    init(
        _ label: String?,
        @ViewBuilder content: @escaping () -> Content) {
            self.label = label
            self.content = content
        }

    var body: some View {
        VStack {
            HStack {
                if let label = label {
                    Text(label)
                        .font(.title2)
                        .fontWeight(.bold)
                }

                Spacer()

                Button {
                    dismiss()
                } label: {
                    Image(symbol: .xmarkCircle)
                        .font(.title2)
                        .foregroundStyle(.tripGray)
                }
            }
            .padding(.top, 20)
            .padding(.horizontal)

            VStack(spacing: 0) {
                Spacer(minLength: 0)
                content()
                Spacer(minLength: 0)
            }
        }
    }
}

extension View {

    @available(*, deprecated, renamed: "bottomSheet")
    func floatingSheet<Content>(
        _ label: String? = nil,
        detent: PresentationDetent = .height(410),
        isPresented: Binding<Bool>,
        onDismiss: (() -> Void)? = nil,
        @ViewBuilder content: @escaping () -> Content
    ) -> some View where Content: View {
        sheet(isPresented: isPresented, onDismiss: onDismiss) {
            FloatingSheet(label, content: content)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .presentationDetents([detent])
                .presentationBackground(.clear)
                .cornerRadius(.background, cornerRadius: 30)
                .padding([.horizontal, .top])
        }
    }
}
