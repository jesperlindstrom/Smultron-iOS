import UIKit

class DetailViewController: UIViewController {
    private let api = APIService.instance
    
    @IBOutlet weak var SwipeView: UIView!
    @IBOutlet weak var codeLabel: UILabel!
    
    var id: String?
    var code: String?
    var data: NSDictionary?

    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
      
        // Do any additional setup after loading the view,q typically from a nib.
        codeLabel.text = code
        let draggableBackground: DraggableViewBackground = DraggableViewBackground(frame: self.view.frame)
        
        draggableBackground.data = data
        self.SwipeView.addSubview(draggableBackground)
        navigationController!.navigationBar.barTintColor = UIColor.whiteColor()
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

