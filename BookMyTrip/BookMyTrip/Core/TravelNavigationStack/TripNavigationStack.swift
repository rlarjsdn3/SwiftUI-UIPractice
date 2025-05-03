//
//  TripNavigationStack.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/1/25.
//

import SwiftUI

// MARK: - TripNavigationStack

///
struct TripNavigationStack<Content>: View where Content: View {
    
    // MARK: Properties
    
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
                VStack(spacing: 0) {
                    navigationToolbar
                        .padding(.top, 1)
                    
                    if navigationTitleDisplayMode == .large {
                        largeNavigationTitle
                            .padding(.top, 14)
                            .padding(.leading)
                    }
                }
                
                VStack {
                    // Ensure the content view inside containerView is always centered
                    // Position the toolbar at the top, unless the container view is empty
                    Spacer(minLength: 0)
                    content()
                    Spacer(minLength: 0)
                }
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
            .toolbarVisibility(.hidden, for: .navigationBar)
            .navigationBarBackButtonHidden()
        }
    }
    
    
    // MARK: Subviews
    
    var navigationToolbar: some View {
        HStack {
            HStack(spacing: toolBarLayout?.leadingSpacing) {
                toolBarLayout?.leadingToolbar?.view
            }
            .padding(.leading)
            Spacer()
            HStack(spacing: toolBarLayout?.trailingSpacing) {
                toolBarLayout?.trarilingToolbar?.view
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
            leadingToolbar: leadingToolbar().eraseToIdentifiableAnyView(),
            leadingSpacing: leadingSpacing,
            trarilingToolbar: trailingToolBar().eraseToIdentifiableAnyView(),
            trailingSpacing: trailingSpacing
        )
        
        return self.preference(key: ToolbarLayoutPreferenceKey.self, value: layout)
    }
}


// MARK: - Previews

#Preview("NavigationStack (Inline)") {
    TripNavigationStack {
        Text("Hello, TripNavigationStack!")
            .travelNavigationBarTitle("Book Your Flight")
            .travelToolBarLayout {
                TripToolBarItem(.symbol(.chevronLeft)) { }
            } trailingToolBar: {
                TripToolBarItem(.shape(Hamburger())) { }
                    .frame(width: 25, height: 20)
            }
        
    }
}

#Preview("NavigationStack (LargeTitle)") {
    TripNavigationStack {
        Text("Hello, TripNavigationStack!")
            .travelNavigationBarTitle("Book Your Flight")
            .travelToolBarLayout {
                TripToolBarItem(.symbol(.chevronLeft)) { }
            } trailingToolBar: {
                TripToolBarItem(.shape(Hamburger())) { }
                    .frame(width: 25, height: 20)
            }
            .travelNavigationBarTitleDisplayMode(.large)
    }
}
