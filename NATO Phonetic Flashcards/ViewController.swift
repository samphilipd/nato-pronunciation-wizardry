//
//  ViewController.swift
//  NATO Phonetic Flashcards
//
//  Created by Sam Davies on 29/03/2017.
//  Copyright © 2017 Sam Davies. All rights reserved.
//

import UIKit

enum State {
    case character
    case telephony
}

class ViewController: UIViewController {
    static let initialState:State = .character

    private var alphabet: Alphabet
    private var letter: Letter
    private var state: State

    required init?(coder aDecoder: NSCoder) {
        self.state = ViewController.initialState
        self.alphabet = Alphabet()
        self.letter = alphabet.nextLetter()
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialState()
        setupLabels()
        setupButton()
        let audioIconImage:UIImage = UIImage(named: "Speaker")!
        self.SpeakButton.setImage(audioIconImage, for: .normal)
        self.SpeakButton.imageView?.contentMode = UIViewContentMode.scaleAspectFit
    }

    @IBOutlet weak var SpeakButton: UIButton!
    @IBOutlet weak var LetterDisplay: UILabel!
    @IBOutlet weak var PronunciationDisplay: UILabel!
    @IBOutlet weak var ModeButton: UIButton!

    @IBAction func ScreenTapped(_ sender: UITapGestureRecognizer) {
        toggleFlashcard()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func NextButtonTapped(_ sender: UIButton) {
        nextLetter()
    }

    @IBAction func AudioButtonTapped(_ sender: UIButton) {
        if isShowingCharacter() {
            letter.sayCharacter()
        } else {
            letter.sayPronunciation()
        }
    }

    @IBAction func ModeButtonTapped(_ sender: UIButton) {
        alphabet.switchMode()
        setupButton()
    }

    func toggleState() {
        if self.state == .character {
            self.state = .telephony
        } else {
            self.state = .character
        }
    }

    func isShowingCharacter() -> Bool {
        return self.state == .character
    }

    func isShowingTelephony() -> Bool {
        return self.state == .telephony
    }

    func mainLabelText() -> String {
        if isShowingCharacter() {
            return letter.character
        } else {
            return letter.telephony
        }
    }

    func nextLetter() {
        setupInitialState()
        self.letter = self.alphabet.nextLetter()
        setupLabels()
    }

    func toggleFlashcard() {
        toggleState()
        setupLabels()
    }

    func setupInitialState() {
        self.state = ViewController.initialState
    }

    func setupLabels() {
        self.LetterDisplay.text = mainLabelText()
        self.PronunciationDisplay.isHidden = isShowingCharacter()
        self.PronunciationDisplay.text = letter.pronunciation
    }

    func setupButton() {
        self.ModeButton.setTitle(self.alphabet.humanReadableMode(), for: .normal)
    }
}

