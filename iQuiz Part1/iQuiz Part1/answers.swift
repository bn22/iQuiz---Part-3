//
//  answers.swift
//  iQuiz Part1
//
//  Created by Bruce Ng on 11/10/15.
//  Copyright © 2015 Bruce Ng. All rights reserved.
//

import Foundation
import UIKit

class answers: UIViewController {
    
    var quizTopic : String = " "
    var givenAnswer : String?
    var givenArray : NSMutableArray = []
    var givenCount : Int = 0
    var givenCorrect : Int = 0
    var givenTotal : Int = 0
    
    @IBOutlet weak var answerQuestion: UILabel!
    @IBOutlet weak var aTitle: UILabel!
    @IBOutlet weak var answerAnswer: UILabel!
    @IBOutlet weak var answerResult: UILabel!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    //print(String(questionsAnswerArray[count]["answer"]!!))
    
    override func viewDidLoad() {
        doneButton.hidden = true
        nextButton.hidden = true
        super.viewDidLoad()
        aTitle.text! = quizTopic
        answerQuestion.text! = String(givenArray[givenCount]["text"]!!)
        answerAnswer.text! = "The correct answer is \(String(givenArray[givenCount]["answers"]!![Int(String(givenArray[givenCount]["answer"]!!))! - 1]))"
        if (givenAnswer == String(givenArray[givenCount]["answers"]!![Int(String(givenArray[givenCount]["answer"]!!))! - 1])) {
            answerResult.text! = "Your answer of \(givenAnswer!) is Correct!"
        } else {
            answerResult.text! = "Your answer of \(givenAnswer!) is Incorrect!"
        }
        // Do any additional setup after loading the view, typically from a nib.
        if (givenCount + 1 < givenTotal) {
            nextButton.hidden = false
        } else {
            doneButton.hidden = false
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (givenAnswer == String(givenArray[givenCount]["answers"]!![Int(String(givenArray[givenCount]["answer"]!!))! - 1])) {
            givenCorrect = givenCorrect + 1
        }
        givenCount = givenCount + 1

        if (segue.identifier == "answersBack") {
            var DestViewController4 : ViewController = segue.destinationViewController as! ViewController
        } else if (segue.identifier == "doneFinished") {
            var DestViewController2 : finished = segue.destinationViewController as! finished
            DestViewController2.quizTitle = quizTopic
            DestViewController2.finishedCorrect = givenCorrect
            DestViewController2.finishedTotal = givenTotal
        } else if (segue.identifier == "nextQuestions") {
            var DestViewControoler5 : questions = segue.destinationViewController as! questions
            DestViewControoler5.questionsAnswerArray = givenArray
            DestViewControoler5.count = givenCount
            DestViewControoler5.correct = givenCorrect
            DestViewControoler5.total = givenTotal
            DestViewControoler5.quizT = quizTopic
        }
    }
}