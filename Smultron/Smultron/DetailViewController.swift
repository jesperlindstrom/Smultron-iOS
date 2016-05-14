//
//  DetailViewController.swift
//  Smultron
//
//  Created by Marco Koivisto on 2016-05-12.
//  Copyright © 2016 Marco Koivisto. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var SwipeView: UIView!


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
        // Do any additional setup after loading the view, typically from a nib.
        let draggableBackground: DraggableViewBackground = DraggableViewBackground(frame: self.view.frame)
        self.SwipeView.addSubview(draggableBackground)
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

