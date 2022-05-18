//
//  ReminderListViewController+Actions.swift
//  Today
//
//  Created by Sansern Wuthirat on 5/18/22.
//

import UIKit

extension ReminderListViewController {
    @objc func didPressDoneButton(_ sender: ReminderDoneButton) {
        guard let id = sender.id else { return }
        completeReminder(with: id)
       }
}
