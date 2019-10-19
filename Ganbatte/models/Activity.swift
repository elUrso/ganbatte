//
//  Activity.swift
//  Ganbatte
//
//  Created by Student on 17/09/19.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation

struct Activity: Codable {
    let name,
        description   : String
    let date          : Date
    let focusedTime   ,
        distractedTime: TimeInterval
    let feedback      : Feedback
}
