//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    // variables to be used to keep track of the quiz
    var currentQuestionIndex = 0
    var score = 0;
    
    // quiz questions and their respective stored in a 2D array to avoind using an array and a dictionary
    let quiz = [
        ["The sun is a star.", "True"],
        ["Water boils at 100 degrees Celsius.", "True"],
        ["Humans have three lungs.", "False"],
        ["Sharks are mammals.", "False"],
        ["The capital of France is Paris.", "True"],
        ["The Earth is flat.", "False"],
        ["Bats are blind.", "False"],
        ["The chemical symbol for gold is Au.", "True"],
        ["Mount Everest is the highest mountain in the world.", "True"],
        ["A leap year has 365 days.", "False"]
    ].shuffled() // shuffled method get the array shuffled while declaring it
    // did this so the quiz isn't repetitive and the questions are displayed in the same order
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set a question when the view loads
        questionLabel.text = quiz[currentQuestionIndex][0]
    }
    
    // action to handle user pressing any of the buttons on the ui
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        // dismiss the action if there are no more questions to be displayed
        if currentQuestionIndex > quiz.endIndex - 1 {
            return
        }
        
        // set variables by getting the user's answer and the correct answer
        let userAnswer = sender.currentTitle!
        let correctAnswer = quiz[currentQuestionIndex][1]
        // set variable to store if the user answered correctly
        let userAnsweredCorrectly = userAnswer == correctAnswer
        
        // using the ternary operator (condition ? valueIfTrue : valueIfFalse) update the user's score
        score += userAnsweredCorrectly ? 1 : 0
        // increment the current question index to display next question
        currentQuestionIndex += 1
        
        // validate if the game is still going on or should display 'end' message
        if currentQuestionIndex - 1 < quiz.endIndex - 1 {
            questionLabel.text = quiz[currentQuestionIndex][0]
        } else {
            questionLabel.text = "You have finished the quiz! You scored: \(score)/\(quiz.endIndex)"
        }
        
        // set the progress dividing the current question index by the quiz array size
        progressBar.progress = Float(currentQuestionIndex) / Float(quiz.endIndex)
    }
    

}

