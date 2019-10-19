//
//  HistoryTableViewCell.swift
//  Ganbatte
//
//  Created by Student on 18/09/19.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {
    
    @IBOutlet var titleOutlet: UILabel!
    @IBOutlet var descriptionOutlet: UILabel!
    @IBOutlet var dateOutlet: UILabel!
    @IBOutlet var focusOutlet: UILabel!
    @IBOutlet var distractedOutlet: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
