import UIKit

class MainSectionView: UIButton {
    init(_ target: MainViewController,
         action: Selector,
         section: Int,
         title: String) {
        super.init(frame: .zero)
        
        self.setTitle(title, for: .normal)
        self.setTitleColor(.white, for: .normal)
        self.backgroundColor = UIColor(named: "mainCellColor")
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        self.layer.cornerRadius = 10
        
        self.addTarget(target, action: action, for: .touchUpInside)
        
        self.tag = section
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
