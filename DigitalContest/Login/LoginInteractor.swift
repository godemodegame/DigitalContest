import UIKit

protocol LoginBusinessLogic {
    func makeRequest(request: Login.Model.Request.RequestType)
}

class LoginInteractor: LoginBusinessLogic {
    
    public var presenter: LoginPresentationLogic?
    private var service: LoginService?
    
    private let networkService = NetworkService()
    
    func makeRequest(request: Login.Model.Request.RequestType) {
        if self.service == nil {
            self.service = LoginService()
        }
        switch request {
        case .signIn(let password, let login):
            guard let password = password, let login = login else { return }
            self.networkService.signIn(password: password,
                                       login: login) { (response) in
                                        self.presenter?.presentData(response: .presentMainPage)
            }
        }
    }
    
}
