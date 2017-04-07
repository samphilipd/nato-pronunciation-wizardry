//
//  ShuffledLetters.swift
//  NATO Phonetic Flashcards
//
//  Created by Sam Davies on 07/04/2017.
//  Copyright © 2017 Sam Davies. All rights reserved.
//

import Foundation

enum Mode:Int {
    case ordered = 0
    case random
    case shuffled
}

class Alphabet {
    static let characters = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ".characters)
    static let modes:Array<Mode> = [.ordered, .random, .shuffled]

    var mode:Mode = .shuffled
    var shuffledOrdering:Array<Int>
    var idx = -1

    init() {
        self.shuffledOrdering = Array(0...25)
        shuffle()
    }

    func nextLetter() -> Letter {
        return Letter(character: String(nextCharacter()))
    }

    func switchMode() {
        switch self.mode {
        case .shuffled:
            self.idx = self.shuffledCharacterIndex()
            self.mode = .ordered
        case .ordered:
            self.mode = .random
        case .random:
            shuffle()
            self.mode = .shuffled
        }
    }

    func humanReadableMode() -> String {
        return "\(self.mode)".capitalized
    }

    private

    func nextCharacter() -> Character {
        switch self.mode {
        case .ordered:
            return nextOrderedCharacter()
        case .random:
            return nextRandomCharacter()
        case .shuffled:
            return nextShuffledCharacter()
        }
    }

    func shuffle() {
        self.shuffledOrdering.shuffle()
    }

    func nextShuffledCharacter() -> Character {
        if self.idx + 1 == self.shuffledOrdering.count {
            shuffle()
            self.idx = 0
        } else {
            self.idx += 1
        }

        let characterIndex = shuffledCharacterIndex()
        let character = Alphabet.characters[characterIndex]

        return character
    }

    func shuffledCharacterIndex() -> Int {
        return self.shuffledOrdering[self.idx]
    }

    func nextRandomCharacter() -> Character {
        let randomIndex: Int = Int(arc4random_uniform(UInt32(Alphabet.characters.count)))
        return Alphabet.characters[randomIndex]
    }

    func nextOrderedCharacter() -> Character {
        if self.idx + 1 == Alphabet.characters.count {
            self.idx = 0
        } else {
            self.idx += 1
        }

        let nextCharacter = Alphabet.characters[self.idx]

        return nextCharacter
    }
}
