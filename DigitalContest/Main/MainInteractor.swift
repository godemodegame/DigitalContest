import UIKit

protocol MainBusinessLogic {
    func makeRequest(request: Main.Model.Request.RequestType)
}

class MainInteractor: MainBusinessLogic {
    
    public var presenter: MainPresentationLogic?
    private var service: MainService?
    
    private let networkService = NetworkService()
    
    public func makeRequest(request: Main.Model.Request.RequestType) {
        if self.service == nil {
            self.service = MainService()
        }
        
        switch request {
        case .fetchPipes:
            self.networkService.fetchPipes { pipeResponse in
                self.presenter?.presentData(response: .present(pipes: pipeResponse ?? []))
            }
        case .edit(let section, let rowsCount, let isExpended):
            if isExpended {
                self.presenter?.presentData(response: .hide(section: section, rowsCount: rowsCount))
            } else {
                self.presenter?.presentData(response: .show(section: section, rowsCount: rowsCount))
            }
        case .loadMario(let pipe):
            self.presenter?.presentData(response: .presentMario(pipe: pipe))
        }
    }
}
