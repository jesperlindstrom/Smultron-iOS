//
//  MasterViewController.swift
//  Smultron
//
//  Created by Marco Koivisto on 2016-05-12.
//  Copyright © 2016 Marco Koivisto. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController {
    private let api = APIService.instance

    @IBOutlet weak var codeField: UITextField!
    @IBOutlet weak var cityField: UITextField!
    
    @IBAction func createRoom(sender: AnyObject) {
        var code = codeField.text
        //code!
    }
    @IBAction func joinRoom(sender: AnyObject) {
        var city = cityField.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController!.navigationBar.barTintColor = UIColor.whiteColor()
        let logo = UIImage(named: "smultron-logo.png")
        let imageView = UIImageView(image:logo)
        //self.navigationItem.titleView = imageView
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
        

    }


}

