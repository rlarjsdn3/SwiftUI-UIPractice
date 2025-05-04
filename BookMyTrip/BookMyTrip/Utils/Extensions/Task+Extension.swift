//
//  Task+Extension.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/4/25.
//

import Foundation

// Reference: Swift by Sundell (swiftbysundell.com)
extension Task where Failure == Error {
    
    @discardableResult
    static func delayed(
        byTimeInterval delayInterval: TimeInterval,
        priority: TaskPriority? = nil,
        @_implicitSelfCapture operation: @escaping @Sendable @isolated(any) () async throws -> Success
    ) -> Task {
        Task(priority: priority) {
            let delay = UInt64(delayInterval * 1_000_000_000)
            // The `sleep` method is only available on `Task` when both `Success` and `Failure` are `Never`.
            try await Task<Never, Never>.sleep(nanoseconds: delay)
            // `Failure` is an `Error` type returned as the Task's result,
            // while `CancellationError()` thrown via `throws` represents a runtime error during execution.
            return try await operation()
        }
    }
}
