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
}
