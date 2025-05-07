//
//  BottomSheet.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/4/25.
//

import SwiftUI

struct BottomSheet<Content>: View where Content: View {

    @Environment(\.safeAreaInsets) var safeAreaInsets: EdgeInsets

    @State private var dragOffsetY: CGFloat = 0
    @State private var isDragging: Bool = false
    @State private var previousDragValue: DragGesture.Value?
    
    private let image: MySymbol
    private let label: String
    private let background: Color?
    private let content: () -> Content

    @Binding private var isPresented: Bool
    
    private var animationDuration: Double { 0.22 }

    init(
        isPresented: Binding<Bool>,
        image: MySymbol,
        label: String,
        background: Color? = nil,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self._isPresented = isPresented
        self.image = image
        self.label = label
        self.background = background
        self.content = content
    }
    
    var roundedRectangle: some Shape {
        RoundedRectangle(cornerRadius: 30)
    }

    var body: some View {
        ZStack(alignment: .bottom) {
            if isPresented {
                VStack(spacing: 0) {
                    headerView
                        .padding(.horizontal)
                        .padding(.top, 24)
                    // 🟠 warning: Image and Text are slightly shift when the drag gesture is ends.
                    
                    contentView

                    MainButton("Ok") {
                        isPresented = false
                    }
                    .padding()
                }
                .frame( maxWidth: .infinity)
                .cornerRadius(background ?? .tripSecondary, cornerRadius: 30)
                .background {
                    roundedRectangle
                        .shadow()
                }
                .overlay {
                    roundedRectangle
                        .stroke(.tripStroke, lineWidth: 1)
                }
                .padding(.horizontal)
                .padding(.bottom, safeAreaInsets.bottom)
                .offset(y: dragOffsetY)
                .fixedSize(horizontal: false, vertical: true)
                .gesture(dragGesture())
                .scaleEffect(isDragging ? 0.95 : 1.0)
                .transition(
                    .asymmetric(
                        insertion: .move(edge: .bottom),
                        removal: .move(edge: .bottom).combined(with: .opacity)
                    )
                )
            }
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .bottom
        )
        .background {
            if isPresented {
                VisualEffectView(style: .systemThinMaterial)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isPresented = false
                    }
            }
        }
        .ignoresSafeArea()
        .animation(.smooth(duration: animationDuration), value: isPresented)
    }
}

extension BottomSheet {
    
    var headerView: some View {
        HStack(spacing: 15) {
            Image(symbol: image)
            Text(label)
        }
        .font(.title2)
        .fontWeight(.bold)
        .foregroundStyle(.tripGray)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var contentView: some View {
        VStack {
            Spacer(minLength: 0)
            content()
            Spacer(minLength: 0)
        }
    }
}

extension BottomSheet {
    
    private func dragGesture() -> some Gesture {
        DragGesture(minimumDistance: 10, coordinateSpace: .local)
            .onChanged(onChanged)
            .onEnded(onEnded)
    }
    
    private func onChanged(value: DragGesture.Value) {
        let yOffset = value.translation.height
        guard let previousDragValue = previousDragValue else {
            previousDragValue = value
            return
        }

        let previousOffsetY = previousDragValue.translation.height
        let heightDiff = Double(yOffset - previousOffsetY)
        
        if heightDiff > 0 {
            dragOffsetY = heightDiff
        } else {
            dragOffsetY = heightDiff * 0.1
        }
        
        withAnimation(.spring(duration: animationDuration)) { isDragging = true }
    }
    
    private func onEnded(drag: DragGesture.Value) {
        if drag.translation.height > 100 {
            dragOffsetY = 0
            isPresented = false
            previousDragValue = nil
            
            // Keeps `isDragging` true to ensure scaleEffect remains active while the sheet is dismissing
            Task.delayed(byTimeInterval: animationDuration) { @MainActor in
                isDragging = false
            }
        } else {
            withAnimation(.spring(duration: animationDuration)) {
                dragOffsetY = 0
                isDragging = false
            }
        }
    }
}

extension View {
    
    /// <#Description#>
    /// - Parameters:
    ///   - isPresented: <#isPresented description#>
    ///   - image: <#image description#>
    ///   - label: <#label description#>
    ///   - content: <#content description#>
    /// - Returns: <#description#>
    func bottomSheet<Content>(
        isPresented: Binding<Bool>,
        image: MySymbol,
        label: String,
        @ViewBuilder content: @escaping () -> Content
    ) -> some View where Content: View {
        ZStack {
            self
            BottomSheet(
                isPresented: isPresented,
                image: image,
                label: label,
                content: content
            )
        }
    }
}



#Preview {
    BottomSheet(
        isPresented: .constant(true),
        image: .calendar,
        label: "Select Departure"
    ) {
        Picker("", selection: .constant(1)) {
            ForEach(1..<10) { i in
                Text("\(i)")
            }
        }
        .pickerStyle(.wheel)
    }
}
