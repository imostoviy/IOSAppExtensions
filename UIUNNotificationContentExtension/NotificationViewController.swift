//
//  NotificationService.swift
//  XORUNNotificationServiceExtension
//
//  Created by Ihor Mostovyi on 23.04.2021.
//

import UIKit
import UserNotifications
import UserNotificationsUI
import Combine

final class NotificationViewController: UIViewController, UNNotificationContentExtension {
    
    private var cancellableDataTask: AnyCancellable?

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var textLabel: UILabel!
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        cancellableDataTask?.cancel()
    }

    func didReceive(_ notification: UNNotification) {
        let apsDictionaty = notification.request.content.userInfo["aps"] as? [String: AnyObject]
        apsDictionaty
            .flatMap { $0["alert"] as? String }
            .map { titleLabel.text = $0 }
            
        apsDictionaty
            .flatMap { $0["text"] as? String }
            .map { textLabel.text = $0 }
        
        apsDictionaty
            .flatMap { $0["url"] as? String }
            .flatMap(URL.init(string:))
            .map(downloadImage(from:))
    }

    private func downloadImage(from url: URL) {
        cancellableDataTask = URLSession
            .shared
            .dataTaskPublisher(for: url)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] output in
                self?.imageView.image = UIImage(data: output.data)
            })
    }
}
