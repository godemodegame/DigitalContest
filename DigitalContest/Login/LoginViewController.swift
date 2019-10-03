import UIKit
import SwiftUI
import AuthenticationServices

protocol LoginDisplayLogic: class {
    func displayData(viewModel: Login.Model.ViewModel.ViewModelData)
}

class LoginViewController: UIViewController, LoginDisplayLogic {
    
    private var interactor: LoginBusinessLogic?
    private var router: (NSObjectProtocol & LoginRoutingLogic)?
    
    @IBOutlet private weak var loginTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var loginWithAppleIdButton: UIView!
    @IBOutlet private weak var logoView: UIView!
    
    // MARK: Setup
    
    private func setup() {
        let viewController        = self
        let interactor            = LoginInteractor()
        let presenter             = LoginPresenter()
        let router                = LoginRouter()
        viewController.interactor = interactor
        viewController.router     = router
        interactor.presenter      = presenter
        presenter.viewController  = viewController
        router.viewController     = viewController
    }
    
    // MARK: Routing
    
    
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
        self.setupLogoView()
        self.setupButtons()
        
        self.logoView.backgroundColor = .clear
        self.view.backgroundColor = UIColor.init(named: "backgroundColor")
    }
    
    private func setupLogoView() {
        let imageView = UIImageView(frame: self.logoView.bounds)
        imageView.image = UIImage(named: "logo")
        self.logoView.addSubview(imageView)
    }
    
    private func setupButtons() {
        self.loginButton.layer.cornerRadius = 5
        self.loginButton.tintColor = .white
        self.loginButton.setTitle("Sign In", for: .normal)
        self.loginButton.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        
        let appleLoginBButton = ASAuthorizationAppleIDButton(frame: self.loginWithAppleIdButton.bounds)
        appleLoginBButton.contentMode = .left
        self.loginWithAppleIdButton.addSubview(appleLoginBButton)
        self.loginWithAppleIdButton.layer.cornerRadius = 5
    }
    
    @objc private func loginButtonPressed() {
        self.interactor?.makeRequest(request: .signIn(password: self.passwordTextField.text, login: self.loginTextField.text))
    }
    
    public func displayData(viewModel: Login.Model.ViewModel.ViewModelData) {
        switch viewModel {
        case .displayMainPage:
            let host = UIHostingController(rootView: ContentView())
            host.modalPresentationStyle = .overFullScreen
            self.present(host, animated: true, completion: nil)
        }
    }
    
}
