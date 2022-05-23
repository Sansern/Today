import Foundation
import EventKit

class ReminderStore {
    
    // Create a static property named shared and assign it a new ReminderStore
    static let shared = ReminderStore()
    
    // Create a private property named ekStore, and assign it a new EKEventStore.
    private let ekStore  = EKEventStore()
    
    var isAvailable: Bool {
        EKEventStore.authorizationStatus(for: .reminder) == .authorized
    }
    
    func readAll() async throws -> [Reminder] {
        guard isAvailable else {
            throw TodayError.accessDenied
        }
        let predicate = ekStore.predicateForReminders(in: nil)
        let ekReminders = try await ekStore.fetchReminders(matching: predicate)
        let reminders: [Reminder] = try ekReminders.compactMap { ekReminder in
            do {
                return try Reminder(with: ekReminder)
            } catch TodayError.reminderHasNoDueDate {
                return nil
            }
            
        }
        return reminders
    }
}
