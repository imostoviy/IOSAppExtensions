//
//  NotificationService.swift
//  XORUNNotificationServiceExtension
//
//  Created by Ihor Mostovyi on 23.04.2021.
//

import UserNotifications

class NotificationService: UNNotificationServiceExtension {

    var contentHandler: ((UNNotificationContent) -> Void)?
    var notificationContent: UNMutableNotificationContent?
    private let key = [UInt8]("sampleKey".utf8)

    override func didReceive(_ request: UNNotificationRequest, withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void) {
        print("receive")
        self.contentHandler = contentHandler
        notificationContent = (request.content.mutableCopy() as? UNMutableNotificationContent)
        
        notificationContent?.title = "Encrypted"
        
         let decryptedBytes = notificationContent
            .flatMap { $0.userInfo["content"] as? [UInt8] }?
            .enumerated()
            .map { $0.element ^ key[$0.offset] }
        
        decryptedBytes
            .flatMap {
                String(bytes: $0, encoding: .utf8)
            }.map {
                notificationContent?.title = $0
            }
        
        notificationContent
            .map {
                contentHandler($0)
            }
    }
    
    override func serviceExtensionTimeWillExpire() {
        if let contentHandler = contentHandler, let bestAttemptContent =  notificationContent {
            contentHandler(bestAttemptContent)
        }
    }
}
