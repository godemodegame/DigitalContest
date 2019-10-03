import UIKit

enum Login {
    
    enum Model {
        struct Request {
            enum RequestType {
                case signIn(password: String?, login: String?)
            }
        }
        struct Response {
            enum ResponseType {
                case presentMainPage
                case presentError(error: SignInError)
            }
        }
        struct ViewModel {
            enum ViewModelData {
                case displayMainPage
            }
        }
    }
}

enum SignInError {
    case incorrectUsernameOrPassword
    case emptyPassword
    case emptyLogin
}
