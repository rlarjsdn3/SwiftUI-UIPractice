//
//  ScrumdigerApp.swift
//  Scrumdiger
//
//  Created by 김건우 on 2023/01/30.
//

import SwiftUI

@main
struct ScrumdigerApp: App {
    @StateObject private var store = ScrumStore()
    @State private var errorWrapper: ErrorWrapper?
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: $store.scrums) {
                    ScrumStore.save(scrums: store.scrums) { result in
                        Task {
                            do {
                                try await ScrumStore.save(scrums: store.scrums)
                            } catch {
                                fatalError("Error saving scrums.")
                            }
                        }
                    }
                }
            }
            .task {
                do {
                    store.scrums = try await ScrumStore.load()
                } catch {
                    errorWrapper = ErrorWrapper(error: error, guidance: "Scrumdinger will load sample data and continue.")
                }
            }
            .sheet(item: $errorWrapper) {
                store.scrums = DailyScrum.sampleData
            } content: { wrapper in
                ErrorView(errorWrapper: wrapper)
            }

        }
    }
}
