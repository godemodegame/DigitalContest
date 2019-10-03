import UIKit

protocol LoginPresentationLogic {
  func presentData(response: Login.Model.Response.ResponseType)
}

class LoginPresenter: LoginPresentationLogic {
  weak var viewController: LoginDisplayLogic?
  
  func presentData(response: Login.Model.Response.ResponseType) {
  
  }
  
}
