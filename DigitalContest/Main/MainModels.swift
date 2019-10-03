import UIKit

enum Main {
    enum Model {
        struct Request {
            enum RequestType {
                case fetchPipes
                case edit(section: Int, rowsCount: Int, isExpended: Bool)
                case loadMario(pipe: PipeViewModel.Pipe)
            }
        }
        struct Response {
            enum ResponseType {
                case present(pipes: [Pipe])
                case hide(section: Int, rowsCount: Int)
                case show(section: Int, rowsCount: Int)
                case presentMario(pipe: PipeViewModel.Pipe)
            }
        }
        struct ViewModel {
            enum ViewModelData {
                case displayPipesResult(pipes: PipeViewModel)
                case hideRows(indexPaths: [IndexPath])
                case showRows(indexPaths: [IndexPath])
                case displayMario(pipe: MarioModelView)
            }
        }
    }
}

struct PipeViewModel {
    struct Pipe {
        let name: String
        let length: String
        let damages: [PipeDamage]
        var isExpended: Bool
    }
    
    var pipes: [Pipe]
}

enum MainViewType {
    case mario
    case list
}
