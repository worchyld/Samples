//
//  NotificationExtensions.swift
//  Extras
//
//  Created by Amarjit on 10/06/2024.
//

import Foundation

class NotificationListener: NSObject {
    @objc func handleDidSaveNotification(_ notification:Notification) {
        print("* Notification received: \(notification)")
    }
}
