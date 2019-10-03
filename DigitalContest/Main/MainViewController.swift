import SwiftUI

protocol MainDisplayLogic: class {
    func displayData(viewModel: Main.Model.ViewModel.ViewModelData)
}

class MainViewController: UIViewController, MainDisplayLogic {
    
    private var interactor: MainBusinessLogic?
    private var router: (NSObjectProtocol & MainRoutingLogic)?
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var pipeViewModel = PipeViewModel.init(pipes: [])
    public var mainViewType: MainViewType!
    
    // MARK: Setup
    
    private func setup() {
        let viewController        = self
        let interactor            = MainInteractor()
        let presenter             = MainPresenter()
        let router                = MainRouter()
        viewController.interactor = interactor
        viewController.router     = router
        interactor.presenter      = presenter
        presenter.viewController  = viewController
        router.viewController     = viewController
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setup()
        self.setupTable()
        
        self.interactor?.makeRequest(request: .fetchPipes)
    }
    
    private func setupTable() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
    }
    
    public func displayData(viewModel: Main.Model.ViewModel.ViewModelData) {
        switch viewModel {
        case .displayPipesResult(let pipes):
            self.pipeViewModel = pipes
            self.tableView.reloadData()
        case .hideRows(let indexPaths):
            self.tableView.deleteRows(at: indexPaths, with: .fade)
        case .showRows(let indexPaths):
            self.tableView.insertRows(at: indexPaths, with: .fade)
        case .displayMario(let pipe):
            let marioView = UIHostingController(rootView: MarioView(pipe: pipe))
            self.present(marioView, animated: true, completion: nil)
        }
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.pipeViewModel.pipes.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {        
        return MainSectionView(self, action: #selector(self.handleOpenClose),
                               section: section,
                               title: self.pipeViewModel.pipes[section].name)
    }
    
    @objc private func handleOpenClose(button: UIButton) {
        let section = button.tag
        if self.mainViewType == .list {
            let isExpend = self.pipeViewModel.pipes[section].isExpended
            self.pipeViewModel.pipes[section].isExpended = !isExpend
            
            self.interactor?.makeRequest(request: .edit(section: section,
                                                        rowsCount: self.pipeViewModel.pipes[section].damages.count,
                                                        isExpended: isExpend))
        } else {
            self.interactor?.makeRequest(request: .loadMario(pipe: self.pipeViewModel.pipes[section]))
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.pipeViewModel.pipes[section].isExpended ? 5 : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        if indexPath.row == 0 {
            cell.textLabel?.textColor = UIColor(named: "text")
            cell.textLabel?.text = "Длина трубы: \(self.pipeViewModel.pipes[indexPath.section].length) км"
        } else if indexPath.row == 4 {
            cell.textLabel?.text = "Подробнее..."
            cell.textLabel?.textColor = UIColor(named: "mainCellColor")
        } else {
            cell.textLabel?.textColor = UIColor(named: "text")
            cell.textLabel?.text = self.pipeViewModel.pipes[indexPath.section].damages[indexPath.row - 1].defect_type + "\n \(self.pipeViewModel.pipes[indexPath.section].damages[indexPath.row - 1].distance) м"
            cell.textLabel?.numberOfLines = 0
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 4 {
            self.interactor?.makeRequest(request: .loadMario(pipe: self.pipeViewModel.pipes[indexPath.section]))
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return self.pipeViewModel.pipes[section].isExpended ? 0 : 30
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
}

// MARK: SwiftUI

struct MainView: UIViewControllerRepresentable {
    
    public let mainViewType: MainViewType
    
    typealias UIViewControllerType = MainViewController
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<MainView>) -> MainViewController {
        return MainViewController.loadFromStoryboard()
    }
    
    func updateUIViewController(_ uiViewController: MainViewController, context: UIViewControllerRepresentableContext<MainView>) {
        uiViewController.mainViewType = self.mainViewType
    }
}
