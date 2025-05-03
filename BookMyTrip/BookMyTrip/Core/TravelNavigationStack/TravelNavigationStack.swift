//
//  TravelNavigationStack.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/1/25.
//

import SwiftUI

// MARK: - TripNavigationStack

#warning("코드 리팩토링 + 툴바 완벽하게 상단에 고정시키기")
#warning("viewHeight PreferenceKey 삭제해보기")
#warning("TripNavigationStack으로 이름 변경")

///
struct TravelNavigationStack<Content>: View where Content: View {
    
    // MARK: Properties

    @State private var dynamicHeight: CGFloat = 0

    @State private var navigationBarHeight: CGFloat = 30
    @State private var navigationBarTitle: String = ""
    @State private var navigationTitleDisplayMode: NavigationBarItem.TitleDisplayMode = .automatic
    @State private var toolBarLayout: ToolbarLayout? = nil

    var content: () -> Content


    // MARK: Intitalizer

    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }

    // MARK: Body

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                ZStack(alignment: .top) {
                    VStack(spacing: 0) {
                        navigationToolbar
                            .background(Color.yellow)
                            .padding(.top, 1)

                        if navigationTitleDisplayMode == .large {
                            largeNavigationTitle
                                .padding(.top, 14)
                                .background {
                                    GeometryReader { geo in
                                        Color.clear
                                            .preference(
                                                key: BarDynamicHeightPreferenceKey.self,
                                                value: geo.size.height
                                            )
                                    }
                                }
                        }
                    }
                    .onPreferenceChange(BarDynamicHeightPreferenceKey.self) { dynaimcHeight in
                        Task { @MainActor in
                            self.dynamicHeight = dynaimcHeight
                        }
                    }

                    content()
                        .padding(
                            .top,
                            navigationTitleDisplayMode == .large
                            ? navigationBarHeight + dynamicHeight - 14
                            : navigationBarHeight
                        )
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                        // top alignment for iPhone 16 Pro Max (6.7 inch)
                }
                .toolbarVisibility(.hidden, for: .navigationBar)
                .navigationBarBackButtonHidden()
            }
            .onPreferenceChange(NavigationBarTitlePreferenceKey.self) { title in
                Task { @MainActor in
                    self.navigationBarTitle = title
                }
            }
            .onPreferenceChange(NavigationBarHeightPreferenceKey.self) { height in
                Task { @MainActor in
                    self.navigationBarHeight = height
                }
            }
            .onPreferenceChange(NavigationBarTitleDisplayModePreferenceKey.self) { mode in
                Task { @MainActor in
                    self.navigationTitleDisplayMode = mode
                }
            }
            .onPreferenceChange(ToolbarLayoutPreferenceKey.self) { layout in
                // 🔴 warning: Bound preference ToolbarLayoutPreferenceKey tried to update multiple times per frame.
                Task { @MainActor in
                    self.toolBarLayout = layout
                }
            }
        }
    }


    // MARK: Subviews

    var navigationToolbar: some View {
        HStack {
            HStack(spacing: toolBarLayout?.leadingSpacing) {
                toolBarLayout?.leadingToolbar?.wrapperView
            }
            .padding(.leading)

            Spacer()

            HStack(spacing: toolBarLayout?.trailingSpacing) {
                toolBarLayout?.trarilingToolbar?.wrapperView
            }
            .padding(.trailing)
        }
        .overlay {
            if navigationTitleDisplayMode != .large {
                inlineNavigationTitle
            }
        }
        .frame(height: navigationBarHeight)
        .frame(maxWidth: .infinity)
    }

    var inlineNavigationTitle: some View {
        Text(navigationBarTitle)
            .font(.title2)
            .fontWeight(.bold)
            .frame(maxWidth: .infinity)
    }

    var largeNavigationTitle: some View {
        Text(navigationBarTitle)
            .font(.largeTitle)
            .fontWeight(.bold)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding([.leading, .bottom])
    }
}



// MARK: - Extensions

extension View {

    /// <#Description#>
    /// - Parameter text: <#text description#>
    /// - Returns: <#description#>
    func travelNavigationBarTitle(_ text: String) -> some View {
        return self.preference(key: NavigationBarTitlePreferenceKey.self, value: text)
    }

    /// <#Description#>
    /// - Parameter height: <#height description#>
    /// - Returns: <#description#>
    func travelNavigationBarHeight(_ height: CGFloat) -> some View {
        return self.preference(key: NavigationBarHeightPreferenceKey.self, value: height)
    }

    /// <#Description#>
    /// - Parameter mode: <#mode description#>
    /// - Returns: <#description#>
    func travelNavigationBarTitleDisplayMode(_ mode: NavigationBarItem.TitleDisplayMode) -> some View {
        return self.preference(key: NavigationBarTitleDisplayModePreferenceKey.self, value: mode)
    }

    /// <#Description#>
    /// - Parameters:
    ///   - leadingSpacing: <#leadingSpacing description#>
    ///   - trailingSpacing: <#trailingSpacing description#>
    ///   - leadingToolbar: <#leadingToolbar description#>
    ///   - trailingToolBar: <#trailingToolBar description#>
    /// - Returns: <#description#>
    func travelToolBarLayout<Leading, Trailing>(
        leadingSpacing: CGFloat? = nil,
        trailingSpacing: CGFloat? = nil,
        @ViewBuilder leadingToolbar: () -> Leading = { EmptyView() },
        @ViewBuilder trailingToolBar: () -> Trailing = { EmptyView() }
    ) -> some View where Leading: View, Trailing: View {
        let layout = ToolbarLayout(
            leadingToolbar: leadingToolbar().eraseToAnyView(),
            leadingSpacing: leadingSpacing,
            trarilingToolbar: trailingToolBar().eraseToAnyView(),
            trailingSpacing: trailingSpacing
        )
        
        return self.preference(key: ToolbarLayoutPreferenceKey.self, value: layout)
    }
}


// MARK: - Previews

#Preview("NavigationStack (Inline)") {
    TravelNavigationStack {
        Color.travelLightPurple
            .travelNavigationBarTitle("Book Your Flight")
            .travelToolBarLayout {
                TravelToolBarItem(.chevronLeft) { }
            } trailingToolBar: {
                TravelToolBarItem(
                    Hamburger().eraseToAnyShape()
                ) { }
                    .frame(width: 25, height: 20)
            }

    }
}

#Preview("NavigationStack (LargeTitle)") {
    TravelNavigationStack {
        Color.travelLightPurple
            .travelNavigationBarTitle("Book Your Flight")
            .travelToolBarLayout {
                TravelToolBarItem(.chevronLeft) { }
            } trailingToolBar: {
                TravelToolBarItem(
                    Hamburger().eraseToAnyShape()
                ) { }
                    .frame(width: 25, height: 20)
            }
            .travelNavigationBarTitleDisplayMode(.large)
    }
}
