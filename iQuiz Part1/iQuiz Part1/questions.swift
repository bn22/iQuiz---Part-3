//
//  questions.swift
//  iQuiz Part1
//
//  Created by Bruce Ng on 11/10/15.
//  Copyright © 2015 Bruce Ng. All rights reserved.
//

import Foundation
import UIKit

class questions: UIViewController {
    
    var quizT : String?
    var questionsAnswerArray : NSMutableArray = []
    var count : Int = 0
    var total : Int = 0
    var correct : Int = 0
    var answer : String = " "
    var selected : Bool = false
    
    @IBOutlet weak var qTitle: UILabel!
    @IBOutlet weak var answer1: UILabel!
    @IBOutlet weak var answer2: UILabel!
    @IBOutlet weak var answer3: UILabel!
    @IBOutlet weak var answer4: UILabel!
    @IBOutlet weak var questionsQuestion: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    @IBAction func answer1Clicked(sender: AnyObject) {
        button1.setTitle("Selected", forState: UIControlState.Normal)
        button2.setTitle("Select", forState: UIControlState.Normal)
        button3.setTitle("Select", forState: UIControlState.Normal)
        button4.setTitle("Select", forState: UIControlState.Normal)
        answer = String(questionsAnswerArray[count]["answers"]!![0])
        selected = true
    }
    
    @IBAction func answer2Clicked(sender: AnyObject) {
        button1.setTitle("Select", forState: UIControlState.Normal)
        button2.setTitle("Selected", forState: UIControlState.Normal)
        button3.setTitle("Select", forState: UIControlState.Normal)
        button4.setTitle("Select", forState: UIControlState.Normal)
        answer = String(questionsAnswerArray[count]["answers"]!![1])
        selected = true
    }
    
    @IBAction func answer3Clicked(sender: AnyObject) {
        button1.setTitle("Select", forState: UIControlState.Normal)
        button2.setTitle("Select", forState: UIControlState.Normal)
        button3.setTitle("Selected", forState: UIControlState.Normal)
        button4.setTitle("Select", forState: UIControlState.Normal)
        answer = String(questionsAnswerArray[count]["answers"]!![2])
        selected = true
    }
    
    @IBAction func answer4Clicked(sender: AnyObject) {
        button1.setTitle("Select", forState: UIControlState.Normal)
        button2.setTitle("Select", forState: UIControlState.Normal)
        button3.setTitle("Select", forState: UIControlState.Normal)
        button4.setTitle("Selected", forState: UIControlState.Normal)
        answer = String(questionsAnswerArray[count]["answers"]!![3])
        selected = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        qTitle.text! = quizT!
        answer1.text! = String(questionsAnswerArray[count]["answers"]!![0])
        answer2.text! = String(questionsAnswerArray[count]["answers"]!![1])
        answer3.text! = String(questionsAnswerArray[count]["answers"]!![2])
        answer4.text! = String(questionsAnswerArray[count]["answers"]!![3])
        questionsQuestion.text! = String(questionsAnswerArray[count]["text"]!!)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "questionsBack") {
            var DestViewController3 : ViewController = segue.destinationViewController as! ViewController
        } else {
            if (selected) {
                if (segue.identifier == "submitQuestions" ) {
                    var DestViewController1 : answers = segue.destinationViewController as! answers
                    DestViewController1.quizTopic = quizT!
                    DestViewController1.givenAnswer = answer
                    DestViewController1.givenArray = questionsAnswerArray
                    DestViewController1.givenCorrect = correct
                    DestViewController1.givenCount = count
                    DestViewController1.givenTotal = total
                }
            } else {
                let alert = UIAlertController(title: "Alert", message: "Click an Option", preferredStyle: UIAlertControllerStyle.Alert)
                let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
                alert.addAction(ok);
                self.presentViewController(alert, animated: true, completion: nil)
            }
        }
    }
}