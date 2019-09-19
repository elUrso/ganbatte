//
//  FeedbackViewController.swift
//  Ganbatte
//
//  Created by Student on 17/09/19.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class FeedbackViewController: UIViewController {

    @IBOutlet var firstQuestionOutlet: UISegmentedControl!
    @IBOutlet var secondQuestionOutlet: UISegmentedControl!
    @IBOutlet var thirdQuestionOutlet: UISegmentedControl!
    
    var activityController: NewActivityViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        prepareOutlets(firstQuestionOutlet)
        prepareOutlets(secondQuestionOutlet)
        prepareOutlets(thirdQuestionOutlet)
        
        // Do any additional setup after loading the view.
    }

    @IBAction func returnFeedback(_ sender: Any) {
        var msg = ""
        if firstQuestionOutlet.selectedSegmentIndex == -1 {
            msg += "Accomplishment is not selected.\n"
        }
        if secondQuestionOutlet.selectedSegmentIndex == -1 {
            msg += "Concentration is not selected.\n"
        }
        if thirdQuestionOutlet.selectedSegmentIndex == -1 {
            msg += "Productivity is not selected.\n"
        }
        
        if msg != "" {
            let alert = UIAlertController(title: "Warning", message: msg, preferredStyle: .alert)
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(
                UIAlertAction(
                    title: "OK",
                    style: .default,
                    handler: nil
                )
            )
            
            // 4. Present the alert.
            self.present(alert, animated: true, completion: nil)
        } else {
            activityController?.feedback = Feedback(
                accomplishment: firstQuestionOutlet.selectedSegmentIndex.asEmotion,
                concentration: secondQuestionOutlet.selectedSegmentIndex.asEmotion,
                productivity: thirdQuestionOutlet.selectedSegmentIndex.asEmotion
            )
            dismiss(
                animated: true,
                completion: {
                    [weak controller = activityController] in
                    controller?.finish()
                }
            )
        }
    }
    
    func prepareOutlets(_ segmentedControl: UISegmentedControl) {
        //let frame = segmentedControl.frame
        //segmentedControl.frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: 2*frame.size.width, height: 48)
        
        let font = UIFont.systemFont(ofSize: 40)
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: font], for: .normal)
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:UIColor.white, NSAttributedString.Key.font: font], for:.selected)

    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
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
