import UIKit

protocol MainPresentationLogic {
    func presentData(response: Main.Model.Response.ResponseType)
}

class MainPresenter: MainPresentationLogic {
    public weak var viewController: MainDisplayLogic?
    
    public func presentData(response: Main.Model.Response.ResponseType) {
        switch response {
        case .present(let pipes):
            let pipe = pipes.map { self.pipes(from: $0) }
            let pipeViewModel = PipeViewModel(pipes: pipe)
            self.viewController?.displayData(viewModel: .displayPipesResult(pipes: pipeViewModel))
        case .hide(let section, let rowsCount):
            self.viewController?.displayData(viewModel: .hideRows(indexPaths: indexPaths(section: section, rowsCount: rowsCount)))
        case .show(let section, let rowsCount):
            self.viewController?.displayData(viewModel: .showRows(indexPaths: indexPaths(section: section, rowsCount: rowsCount)))
        case .presentMario(let pipe):
            self.viewController?.displayData(viewModel: .displayMario(pipe: marioModelView(pipe: pipe)))
        }
    }
    
    private func marioModelView(pipe: PipeViewModel.Pipe) -> MarioModelView {
        var id = 0
        return MarioModelView(id: 0, name: pipe.name, length: "\(pipe.length) км", damages: pipe.damages.map {
            id += 1
            return MarioModelView.PipeDamage(id: id,
                                             name: $0.defect_type,
                                             location: "\($0.distance)") }  )
    }
    
    private func indexPaths(section: Int, rowsCount: Int) -> [IndexPath] {
        var indexPaths = [IndexPath]()
        for row in 0...4 {
            let indexPath = IndexPath(row: row, section: section)
            indexPaths.append(indexPath)
        }
        return indexPaths
    }
    
    private func pipes(from pipe: Pipe) -> PipeViewModel.Pipe {
        return PipeViewModel.Pipe(name: pipe.name,
                                  length: "\(pipe.length)",
                                  damages: pipe.defects ?? [],
                                  isExpended: false)
    }
}

