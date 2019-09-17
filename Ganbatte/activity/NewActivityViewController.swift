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
    var timer = TimerState.Stop(focus: 0.0, distracted: 0.0)
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet var focusTimerLabel: UILabel!
    
    @IBOutlet var distractedTimerLabel: UILabel!
    
    @IBAction func toggleTimer(_ sender: Any) {
        toogle()
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
            break
        case .Distracted(let focus, let distracted, let timer):
            break
        }
    }
    
    @IBAction func stopTimer(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
