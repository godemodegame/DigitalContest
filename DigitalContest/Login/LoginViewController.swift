import UIKit

protocol LoginDisplayLogic: class {
  func displayData(viewModel: Login.Model.ViewModel.ViewModelData)
}

class LoginViewController: UIViewController, LoginDisplayLogic {

  var interactor: LoginBusinessLogic?
  var router: (NSObjectProtocol & LoginRoutingLogic)?

  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }
  
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
  }
  
  func displayData(viewModel: Login.Model.ViewModel.ViewModelData) {

  }
  
}
