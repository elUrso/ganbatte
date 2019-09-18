//
//  NewActivityViewController.swift
//  Ganbatte
//
//  Created by Student on 16/09/19.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

enum TimerState {
    case Stop(focus: TimeInterval, distracted: TimeInterval)
    case Focused(focus: TimeInterval, distracted: TimeInterval, timer: Timer)
    case Distracted(focus: TimeInterval, distracted: TimeInterval, timer: Timer)
}

class NewActivityViewController: UIViewController {
    var activityDelegate: TodoViewController? = nil
    
    let updateDelta: TimeInterval = 1
    
    var canUpdate: Bool = false
    
    var feedback: Feedback? = nil
    
    var name: String = ""

    var timer = TimerState.Stop(focus: 0.0, distracted: 0.0) {
        didSet {
            updateTimer()
        }
    }
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var descriptionTextField: UITextField!
    @IBOutlet var focusTimerLabel: UILabel!
    
    @IBOutlet var distractedTimerLabel: UILabel!
    
    @IBOutlet var toogleButton: UIButton!
    
    @IBAction func toggleTimer(_ sender: Any) {
        toogle()
        switch timer {
        case .Stop(_, _):
            toogleButton.setTitle("Start", for: .normal)
        case .Focused(_, _, _):
            toogleButton.setTitle("Pause", for: .normal)
        case .Distracted(_, _, _):
            toogleButton.setTitle("Resume", for: .normal)
        }
    }
    
    func updateTimer() {
        if canUpdate {
            switch timer {
            case .Focused(let focus, _, _):
                focusTimerLabel.text = focus.asTimestamp
            case .Distracted(_, let distracted, _):
                distractedTimerLabel.text = distracted.asTimestamp
            default:
                break
            }
        }
    }
    
    func toogle() {
        switch timer {
        case .Stop:
            let clock = Timer.scheduledTimer(
                withTimeInterval: updateDelta, repeats: true, block: {_ in
                    switch self.timer {
                    case .Focused(let focus, let distracted, let timer):
                        self.timer = .Focused(focus: focus + self.updateDelta, distracted: distracted, timer: timer)
                    default:
                        break
                    }
                }
            )
            clock.fire()
            
            timer = .Focused(
                focus: 0.0,
                distracted: 0.0,
                timer: clock
            )

        case .Focused(let focus, let distracted, let timer):
            timer.invalidate()
            let clock = Timer.scheduledTimer(
                withTimeInterval: self.updateDelta, repeats: true, block: {_ in
                    switch self.timer {
                    case .Distracted(let focus, let distracted, let timer):
                        self.timer = .Distracted(focus: focus, distracted: distracted + self.updateDelta, timer: timer)
                    default:
                        break
                    }
                }
            )

            clock.fire()

            self.timer = .Distracted(
                focus: focus,
                distracted: distracted,
                timer: clock
            )
        case .Distracted(let focus, let distracted, let timer):
            timer.invalidate()
            let clock = Timer.scheduledTimer(
                withTimeInterval: updateDelta, repeats: true, block: {_ in
                    switch self.timer {
                    case .Focused(let focus, let distracted, let timer):
                        self.timer = .Focused(focus: focus + self.updateDelta, distracted: distracted, timer: timer)
                    default:
                        break
                    }
                }
            )

            clock.fire()

            self.timer = .Focused(
                focus: focus,
                distracted: distracted,
                timer: clock
            )
        }
    }
    
    @IBAction func stopTimer(_ sender: Any) {
        switch timer {
        case .Focused(let focus, let distracted, let timer):
            timer.invalidate()
            self.timer = .Stop(focus: focus, distracted: distracted)
        case .Distracted(let focus, let distracted, let timer):
            timer.invalidate()
            self.timer = .Stop(focus: focus, distracted: distracted)
        default:
            break
        }
        
        let feedback = FeedbackViewController(nibName: "FeedbackViewController", bundle: nil)
        feedback.activityController = self
        present(feedback, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        canUpdate = true
        nameTextField.text = name
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    func finish()
    {
        switch timer {
        case .Stop(let focus, let distracted):
            let activity = Activity(
                name: nameTextField.text ?? "Untitled activity",
                description: descriptionTextField.text ?? "No description",
                date: Date(),
                focusedTime: focus,
                distractedTime: distracted,
                feedback: feedback!
            )
            
            activityDelegate?.activity = activity
            
            dismiss(animated: true, completion: {
                [weak delegate = activityDelegate] in
                delegate?.saveActivity()
            })
        default: break
        }
        

    }
}

