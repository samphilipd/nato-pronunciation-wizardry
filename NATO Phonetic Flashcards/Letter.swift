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
    let pronunciation: String

    static let letters = [
        "A": ["Alfa", "AL-FAH"],
        "B": ["Bravo", "BRAH-VOH"],
        "C": ["Charlie", "CHAR-LEE"],
        "D": ["Delta", "DELL-TAH"],
        "E": ["Echo", "ECK-OH"],
        "F": ["Foxtrot", "FOKS-TROT"],
        "G": ["Golf", "GOLF"],
        "H": ["Hotel", "HOH-TEL"],
        "I": ["India", "IN-DEE-AH"],
        "J": ["Juliet", "JEW-LEE-ETT"],
        "K": ["Kilo", "KEY-LOH"],
        "L": ["Lima", "LEE-MAH"],
        "M": ["Mike", "MIKE"],
        "N": ["November", "NO-VEM-BER"],
        "O": ["Oscar", "OSS-CAH"],
        "P": ["Papa", "PAH-PAH"],
        "Q": ["Quebec", "KEH-BECK"],
        "R": ["Romeo", "ROW-ME-OH"],
        "S": ["Sierra", "SEE-AIR-RAH"],
        "T": ["Tango", "TANG-GO"],
        "U": ["Uniform", "YOU-NEE-FORM"],
        "V": ["Victor", "VIK-TAH"],
        "W": ["Whiskey", "WISS-KEY"],
        "X": ["X-ray", "ECKS-RAY"],
        "Y": ["Yankee", "YANG-KEY"],
        "Z": ["Zulu", "ZOO-LOO"],
    ]

    static func randomLetter() -> Letter {
        let randomIndex: Int = Int(arc4random_uniform(UInt32(self.letters.count)))
        let randomCharacter = Array(self.letters.keys)[randomIndex]
        return Letter(character: randomCharacter)
    }

    init(character: String) {
        self.character = character
        if let telephonyAndPronuncation = Letter.letters[character] {
            self.telephony = telephonyAndPronuncation[0]
            self.pronunciation = telephonyAndPronuncation[1]
        } else {
            fatalError("\"\(character)\" is not in range A-Z")
        }
    }
}
