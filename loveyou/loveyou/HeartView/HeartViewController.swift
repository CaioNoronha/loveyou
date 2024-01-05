import UIKit

public final class HeartViewController: UIViewController {
    
    private var heartImage = UIImage()
    private var heartBackground = UIImage()
    
    public init(heartImage: UIImage, heartBackground: UIImage) {
        super.init(nibName: nil, bundle: nil)
        self.heartImage = heartImage
        self.heartBackground = heartBackground
    }
    
    required init?(coder: NSCoder) { nil }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
    
    public override func loadView() {
        view = HeartView(image: heartImage, background: heartBackground)
        setupNavigation()
    }
    
    private func setupNavigation() {
        navigationController?.navigationBar.backItem?.title = "Amor Agendado"
    }
}
