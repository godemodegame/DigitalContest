import UIKit

protocol LoginPresentationLogic {
    func presentData(response: Login.Model.Response.ResponseType)
}

class LoginPresenter: LoginPresentationLogic {
    weak var viewController: LoginDisplayLogic?
    
    func presentData(response: Login.Model.Response.ResponseType) {
        switch response {
        case .presentMainPage:
            self.viewController?.displayData(viewModel: .displayMainPage)
        default:
            print("error")
        }
    }
    
}
