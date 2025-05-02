//
//  TravelNavigationStack.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/1/25.
//

import SwiftUI

// MARK: - NavigationStack

///
struct TravelNavigationStack<Content>: View where Content: View {
    
    // MARK: Properties
    
    @State private var navigationBarHeight: CGFloat = 50
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
                VStack(spacing: 0) {
                    navigationToolbar

                    if navigationTitleDisplayMode == .large {
                        largeNavigationTitle
                            .padding(.top, 4)
                    }

                    content()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .toolbarVisibility(.hidden, for: .navigationBar)
                .navigationBarBackButtonHidden()
            }
            .onPreferenceChange(NavigationBarTitlePreferenceKey.self) { title in
                self.navigationBarTitle = title
            }
            .onPreferenceChange(NavigationBarHeightPreferenceKey.self) { height in
                self.navigationBarHeight = height
            }
            .onPreferenceChange(NavigationBarTitleDisplayModePreferenceKey.self) { mode in
                self.navigationTitleDisplayMode = mode
            }
            .onPreferenceChange(ToolbarLayoutPreferenceKey.self) { layout in
                self.toolBarLayout = layout
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
        .frame(height: navigationBarHeight)
        .frame(maxWidth: .infinity)
        .overlay {
            if navigationTitleDisplayMode != .large {
                inlineNavigationTitle
            }
        }
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
        return self.preference(
            key: ToolbarLayoutPreferenceKey.self,
            value: ToolbarLayout(
                leadingToolbar: leadingToolbar().eraseToAnyView(),
                leadingSpacing: leadingSpacing,
                trarilingToolbar: trailingToolBar().eraseToAnyView(),
                trailingSpacing: trailingSpacing
            )
        )
    }
}


// MARK: - Previews

#Preview("NavigationStack with InlineTitle") {
    TravelNavigationStack {
        Color.travelLightPurple
            .travelNavigationBarTitle("Select Ticket")
            .travelToolBarLayout {
                TravelToolBarItem(.chevronLeft) {
                }
            } trailingToolBar: {
                TravelToolBarItem(
                    Hamburger().eraseToAnyShape()
                ) { }
                    .frame(width: 25, height: 20)
            }
            .ignoresSafeArea()

    }
}

#Preview("NavigationStack with LargeTitle") {
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
            .ignoresSafeArea()
            .travelNavigationBarTitleDisplayMode(.large)
    }
}
