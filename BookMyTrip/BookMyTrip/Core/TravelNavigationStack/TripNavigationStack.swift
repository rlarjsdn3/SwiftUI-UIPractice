//
//  TripNavigationStack.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/1/25.
//

import SwiftUI

struct TripNavigationStack<Content>: View where Content: View {
    
    @State private var navigationBarHeight: CGFloat = 30
    @State private var navigationBarTitle: String = ""
    @State private var navigationTitleDisplayMode: NavigationBarItem.TitleDisplayMode = .automatic
    @State private var toolBarLayout: ToolbarLayout? = nil
    
    var content: () -> Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }

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
}

extension TripNavigationStack {

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

extension View {
    
    /// 네비게이션 바의 제목을 설정합니다.
    /// - Parameter text: 네비게이션 바에 표시할 제목
    /// - Returns: 제목이 적용된 뷰
    func travelNavigationBarTitle(_ text: String) -> some View {
        return self.preference(key: NavigationBarTitlePreferenceKey.self, value: text)
    }
    
    /// 네비게이션 바의 높이를 설정합니다.
    /// - Parameter height: 네비게이션 바의 높이
    /// - Returns: 높이가 적용된 뷰
    func travelNavigationBarHeight(_ height: CGFloat) -> some View {
        return self.preference(key: NavigationBarHeightPreferenceKey.self, value: height)
    }
    
    /// 네비게이션 바의 제목 표시 모드를 설정합니다.
    /// - Parameter mode: 제목 표시 모드 (예: 자동, 크기 조정)
    /// - Returns: 모드가 적용된 뷰
    func travelNavigationBarTitleDisplayMode(_ mode: NavigationBarItem.TitleDisplayMode) -> some View {
        return self.preference(key: NavigationBarTitleDisplayModePreferenceKey.self, value: mode)
    }
    
    /// 네비게이션 바의 툴바 레이아웃을 설정합니다.
    /// - Parameters:
    ///   - leadingSpacing: 좌측 툴바 버튼 간 간격 (기본값: nil)
    ///   - trailingSpacing: 우측 툴바 버튼 간 간격 (기본값: nil)
    ///   - leadingToolbar: 좌측 툴바 콘텐츠 (기본값: 비어 있음)
    ///   - trailingToolBar: 우측 툴바 콘텐츠 (기본값: 비어 있음)
    /// - Returns: 툴바 레이아웃이 적용된 뷰
    func travelToolBarLayout<Leading, Trailing>(
        leadingSpacing: CGFloat? = nil,
        trailingSpacing: CGFloat? = nil,
        @ViewBuilder leadingToolbar: () -> Leading = { EmptyView() },
        @ViewBuilder trailingToolBar: () -> Trailing = { EmptyView() }
    ) -> some View where Leading: View, Trailing: View {
        let layout = ToolbarLayout(
            leadingToolbar: leadingToolbar().eraseToIdentifiedView,
            leadingSpacing: leadingSpacing,
            trarilingToolbar: trailingToolBar().eraseToIdentifiedView,
            trailingSpacing: trailingSpacing
        )
        
        return self.preference(key: ToolbarLayoutPreferenceKey.self, value: layout)
    }
}



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
