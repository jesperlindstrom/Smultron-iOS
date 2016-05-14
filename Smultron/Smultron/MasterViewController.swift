import UIKit

class MasterViewController: UIViewController {
    private let api = APIService.instance

    @IBOutlet weak var codeField: UITextField!
    @IBOutlet weak var cityField: UITextField!
    
    var data: NSDictionary?
    
    @IBAction func createRoom(sender: AnyObject) {
        let city = cityField.text!
        print("createRoom")
        api.createRoom(city, callback: { response in
            print(response)
            self.data = response
            self.performSegueWithIdentifier("detail", sender: sender)
        })
    }
    @IBAction func joinRoom(sender: AnyObject) {
        let code = codeField.text!
        print("joinRoom")
        api.joinRoom(code, callback: { response in
            print(response)
            self.data = response
            self.performSegueWithIdentifier("detail", sender: sender)
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController!.navigationBar.barTintColor = UIColor.whiteColor()
        let logo = UIImage(named: "Logo.png")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func insertNewObject(sender: AnyObject) {
    }

    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let theRoom: DetailViewController = segue.destinationViewController as! DetailViewController
        
        theRoom.code = codeField.text!
        theRoom.id = api.roomId!
        theRoom.data = data
    }


}

