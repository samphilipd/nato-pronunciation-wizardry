//
//  Letter.swift
//  NATO Phonetic Flashcards
//
//  Created by Sam Davies on 29/03/2017.
//  Copyright © 2017 Sam Davies. All rights reserved.
//

import UIKit

class Letter: NSObject {

    // MARK: Properties
    let character: String
    let telephony: String

    static let letters = [
        "A": "Alfa",
        "B": "Bravo",
        "C": "Charlie",
        "D": "Delta",
        "E": "Echo",
        "F": "Foxtrot",
        "G": "Golf",
        "H": "Hotel",
        "I": "India",
        "J": "Juliet",
        "K": "Kilo",
        "L": "Lima",
        "M": "Mike",
        "N": "November",
        "O": "Oscar",
        "P": "Papa",
        "Q": "Quebec",
        "R": "Romeo",
        "S": "Sierra",
        "T": "Tango",
        "U": "Uniform",
        "V": "Victor",
        "W": "Whiskey",
        "X": "X-ray",
        "Y": "Yankee",
        "Z": "Zulu",
    ]

    static func randomLetter() -> Letter {
        let randomIndex: Int = Int(arc4random_uniform(UInt32(self.letters.count)))
        let randomCharacter = Array(self.letters.keys)[randomIndex]
        return Letter(character: randomCharacter)
    }

    init(character: String) {
        self.character = character

        if let telephony = Letter.letters[character] {
            self.telephony = telephony
        } else {
            fatalError("\"\(character)\" is not in range A-Z")
        }
    }
}
