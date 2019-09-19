//
//  ActivityDetailViewController.swift
//  Ganbatte
//
//  Created by Student on 18/09/19.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class ActivityDetailViewController: UIViewController {

    @IBOutlet var testLabel: UILabel!
    
    var activity: Activity? = nil {
        didSet {
            // Nothing
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let activity = activity {
            testLabel.text = activity.name
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
