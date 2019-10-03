import UIKit

protocol LoginBusinessLogic {
  func makeRequest(request: Login.Model.Request.RequestType)
}

class LoginInteractor: LoginBusinessLogic {

  var presenter: LoginPresentationLogic?
  var service: LoginService?
  
  func makeRequest(request: Login.Model.Request.RequestType) {
    if service == nil {
      service = LoginService()
    }
  }
  
}
