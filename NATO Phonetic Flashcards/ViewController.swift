//
//  ViewController.swift
//  NATO Phonetic Flashcards
//
//  Created by Sam Davies on 29/03/2017.
//  Copyright © 2017 Sam Davies. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var letter: Letter

    required init?(coder aDecoder: NSCoder) {
        letter = Letter.randomLetter()
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        self.LetterDisplay.text = letter.character
    }

    @IBOutlet weak var LetterDisplay: UILabel!

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

    func nextLetter() {
        self.letter = Letter.randomLetter()
        self.LetterDisplay.text = letter.character
    }

    func toggleFlashcard() {
        if self.LetterDisplay.text == self.letter.character {
            self.LetterDisplay.text = self.letter.telephony
        } else {
            self.LetterDisplay.text = self.letter.character
        }
    }
}

