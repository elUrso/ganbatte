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
    var canUpdate: Bool = false

    var timer = TimerState.Stop(focus: 0.0, distracted: 0.0) {
        didSet {
            updateTimer()
        }
    }
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet var focusTimerLabel: UILabel!
    
    @IBOutlet var distractedTimerLabel: UILabel!
    
    @IBAction func toggleTimer(_ sender: Any) {
        toogle()
    }
    
    func updateTimer() {
        if canUpdate {
            switch timer {
            case .Focused(let focus, let _, let _):
                focusTimerLabel.text = "\(focus)"
            case .Distracted(let _, let distracted, let _):
                focusTimerLabel.text = "\(distracted)"
            default:
                break
            }
        }
    }
    
    func toogle() {
        switch timer {
        case .Stop:
            var clock = Timer.scheduledTimer(
                withTimeInterval: 1, repeats: true, block: {_ in
                    switch self.timer {
                    case .Focused(let focus, let distracted, let timer):
                        self.timer = .Focused(focus: focus + 1, distracted: distracted, timer: timer)
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
            timer.stop()
            var clock = Timer.scheduledTimer(
                withTimeInterval: 1, repeats: true, block: {_ in
                    switch self.timer {
                    case .Focused(let focus, let distracted, let timer):
                        self.timer = .Distracted(focus: focus, distracted: distracted + 1, timer: timer)
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
            timer.stop()
            var clock = Timer.scheduledTimer(
                withTimeInterval: 1, repeats: true, block: {_ in
                    switch self.timer {
                    case .Focused(let focus, let distracted, let timer):
                        self.timer = .Distracted(focus: focus + 1, distracted: distracted, timer: timer)
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
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        canUpdate = true
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
