import UIKit

class MasterViewController: UIViewController {
    private let api = APIService.instance

    @IBOutlet weak var codeField: UITextField!
    @IBOutlet weak var cityField: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    
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
        
        let notificationCenter = NSNotificationCenter.defaultCenter()
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIKeyboardWillHideNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIKeyboardWillChangeFrameNotification, object: nil)
    }
    
    func adjustForKeyboard(notification: NSNotification) {
        let userInfo = notification.userInfo!
        
        let keyboardScreenEndFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
        let keyboardViewEndFrame = view.convertRect(keyboardScreenEndFrame, fromView: view.window)
        
        if notification.name == UIKeyboardWillHideNotification {
            scrollView.contentInset = UIEdgeInsetsZero
        } else {
            scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardViewEndFrame.height - 150, right: 0)
        }
        
        scrollView.scrollIndicatorInsets = scrollView.contentInset
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        super.navigationController?.navigationBar.hidden = true
        super.navigationController?.navigationBar.barStyle = UIBarStyle.Black
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        super.navigationController?.navigationBar.hidden = false
        super.navigationController?.navigationBar.barStyle = UIBarStyle.Default
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func insertNewObject(sender: AnyObject) {
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let theRoom: DetailViewController = segue.destinationViewController as! DetailViewController
        
        theRoom.code = codeField.text
        theRoom.id = api.roomId
        theRoom.data = data
    }


}

