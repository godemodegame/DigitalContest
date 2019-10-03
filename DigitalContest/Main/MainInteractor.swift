import UIKit

protocol MainBusinessLogic {
  func makeRequest(request: Main.Model.Request.RequestType)
}

class MainInteractor: MainBusinessLogic {

  var presenter: MainPresentationLogic?
  var service: MainService?
  
  func makeRequest(request: Main.Model.Request.RequestType) {
    if service == nil {
      service = MainService()
    }
  }
  
}
