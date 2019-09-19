//
//  TodayViewController.swift
//  Ganbatte
//
//  Created by Student on 13/09/19.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class TodayViewController: UIViewController {

    @IBOutlet var monthLabel: UILabel!
    @IBOutlet var dayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Setting the month
        monthLabel.text = getMonthName()
        dayLabel.text = getDayName()
    }

    func getMonthName() -> String {
        let date = Date()
        let format = DateFormatter()
        let calendar = Calendar.current
        return format.monthSymbols[calendar.component(.month, from: date)-1]
    }
    
    func getDayName() -> String {
        let date = Date()
        let format = DateFormatter()
        let calendar = Calendar.current
        let weekday = calendar.component(.weekday, from: date)
        let weekdayName = format.weekdaySymbols[weekday-1]
        let monthday = calendar.component(.day, from: date)
        let monthdayName = monthday.asOrdinal
        return "\(monthdayName), \(weekdayName)"
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


extension Int {
    var asOrdinal: String {
        get {
            switch self {
            case 1:
                return "1st"
            case 2:
                return "2nd"
            case 3:
                return "3rd"
            default:
                return "\(self)th"
            }
        }
    }
}
