import UIKit

class DetailViewController: UIViewController {
    private let api = APIService.instance
    
    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var SwipeView: UIView!
    @IBOutlet weak var codeLabel: UILabel!
    
    var id = ""
    var code = ""
    var data: NSDictionary?

    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = detail.description
            }
        }
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

