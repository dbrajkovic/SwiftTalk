import UIKit
import XCPlayground

public struct Title {
    public let titleView: UIView
    public init() {
        titleView = UIView(frame: CGRect(x: 0, y: 0, width: 1024, height: 768))
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 1024, height: 768))
        label.numberOfLines = 2
        label.textAlignment = .Center
        label.center = titleView.center
        label.text = "\nCode Swift(ly)"
        label.font = UIFont(name: "Times", size: 160.0)
        titleView.addSubview(label)
    }
}
