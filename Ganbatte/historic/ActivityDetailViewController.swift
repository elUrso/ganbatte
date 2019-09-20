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
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var focusedLabel: UILabel!
    
    @IBOutlet var distractedLabel: UILabel!
    
    @IBOutlet var accomplishmentLabel: UILabel!
    @IBOutlet var concentrationLabel: UILabel!
    @IBOutlet var productivityLabel: UILabel!
    
    
    var activity: Activity? = nil {
        didSet {
            // Nothing
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let activity = activity {
            nameLabel.text = activity.name
            descriptionLabel.text = activity.description
            focusedLabel.text = activity.focusedTime.asTimestamp
            distractedLabel.text = activity.distractedTime.asTimestamp
            accomplishmentLabel.text = "Accomplishment \(activity.feedback.accomplishment.asEmoji)"
            concentrationLabel.text = "Concentration \(activity.feedback.concentration.asEmoji)"
            productivityLabel.text = "Productitvity \(activity.feedback.productivity.asEmoji)"
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
