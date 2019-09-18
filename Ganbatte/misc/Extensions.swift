//
//  Extensions.swift
//  Ganbatte
//
//  Created by Student on 17/09/19.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation

extension TimeInterval {
    var asTimestamp: String {
        get {
            
            let _ = Int(((self - self.rounded(.down)) * 1000).rounded())
            
            let seconds = Int(self.rounded(.down)) % 60
            
            let minutes = Int((self/60).rounded(.down))

            let hours = Int((self/360).rounded(.down))
            
            return "\(hours.asDoubleDigit):\(minutes.asDoubleDigit):\(seconds.asDoubleDigit)"
        }
    }
}

extension Int {
    var asEmotion: Emotion {
        get {
            if self%3 == 0 { return .Sad }
            else if self%3 == 1 { return .Neutral }
            else { return .Happy }
        }
    }
    var asDoubleDigit: String {
        get {
            if self >= 10 {return self.description}
            else {
                return "0" + self.description
            }
        }
    }
}

