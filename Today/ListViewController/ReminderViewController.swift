//
//  ReminderViewController.swift
//  Today
//
//  Created by Sansern Wuthirat on 5/20/22.
//

import UIKit

class ReminderViewController: UICollectionViewController {
    var reminder: Reminder
    
    init(reminder: Reminder){
        self.reminder = reminder
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        listConfiguration.showsSeparators = false
        let listlayout = UICollectionViewCompositionalLayout.list(using: listConfiguration)
        super.init(collectionViewLayout: listlayout)
    }
    
    required init? (coder: NSCoder) {
        fatalError("Always initialize ReminderViewController using init(reminder:)")
    }
}
