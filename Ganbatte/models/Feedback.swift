//
//  Feedback.swift
//  Ganbatte
//
//  Created by Student on 17/09/19.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation

enum Emotion {
    case Sad
    case Neutral
    case Happy
}

struct Feedback : Codable {
    let accomplishment: Emotion
    let concentration: Emotion
    let productivity: Emotion
}

extension Emotion: Codable {
    
    enum Key: CodingKey {
        case rawValue
    }
    
    enum CodingError: Error {
        case unknownValue
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Key.self)
        let rawValue = try container.decode(Int.self, forKey: .rawValue)
        switch rawValue {
        case 0:
            self = .Sad
        case 1:
            self = .Neutral
        case 2:
            self = .Happy
        default:
            throw CodingError.unknownValue
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: Key.self)
        switch self {
        case .Sad:
            try container.encode(0, forKey: .rawValue)
        case .Neutral:
            try container.encode(1, forKey: .rawValue)
        case .Happy:
            try container.encode(2, forKey: .rawValue)
        }
    }
}

extension Emotion {
    var asEmoji: String {
        get {
            switch self {
                case .Sad:
                return "☹️"
                case .Neutral:
                return "😐"
                case .Happy:
                return "🙂"
            }
        }
    }
}
