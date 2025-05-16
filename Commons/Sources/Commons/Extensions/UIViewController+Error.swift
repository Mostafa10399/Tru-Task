import UIKit
import Corekit
import NetworkLayer
import Combine

public extension UIViewController {
    
    // MARK: - Methods
    func present(errorMessage: APIError) {
        let errorAlertController = UIAlertController(title: "Ops",
                                                     message: errorMessage.localizedDescription,
                                                     preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        errorAlertController.addAction(okAction)
        present(errorAlertController, animated: true, completion: nil)
    }
    
    func present(errorMessage: APIError,
                 withPresentationState errorPresentation: CurrentValueSubject<ErrorPresentation?, Never>? = nil) {
        errorPresentation?.send(.presenting)
        let errorAlertController = UIAlertController(title: "Ops",
                                                     message: errorMessage.localizedDescription,
                                                     preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            errorPresentation?.send(.dismissed)
            errorPresentation?.send(nil)
        }
        errorAlertController.addAction(okAction)
        present(errorAlertController, animated: true, completion: nil)
    }
}
