import UIKit

// MARK: - alert

extension UIViewController {

    func showAlert(_ title: String,
                   message: String,
                   okAction: ((UIAlertAction) -> Void)? = nil,
                   notificationType: UINotificationFeedbackGenerator.FeedbackType = .error) {
        let alert = {
            OperationQueue.main.addOperation {
                let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
                let ok = UIAlertAction(title: "OK", style: .default, handler: okAction)
                alertController.addAction(ok)
                UINotificationFeedbackGenerator().notificationOccurred(notificationType)
                self.present(alertController, animated: true, completion: nil)
            }
        }

        DispatchQueue.main.async {
            if let nc = self.navigationController,
                let vc = nc.visibleViewController,
                !vc.isKind(of: UIAlertController.self) {
                alert()
            } else if let nc = self.presentingViewController as? UINavigationController,
                let vc = nc.visibleViewController,
                !vc.isKind(of: UIAlertController.self) {
                alert()
            } else {
                alert()
            }
        }
    }

}
