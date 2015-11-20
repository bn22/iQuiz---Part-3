//
//  finished.swift
//  iQuiz Part1
//
//  Created by Bruce Ng on 11/10/15.
//  Copyright © 2015 Bruce Ng. All rights reserved.
//

import Foundation
import UIKit

class finished: UIViewController {
    
    var quizTitle : String?
    var finishedCorrect : Int = 0
    var finishedTotal : Int = 0
    var desc : String = " "
    @IBOutlet weak var fTitle: UILabel!
    @IBOutlet weak var scoreFinished: UILabel!
    @IBOutlet weak var descriptFinished: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fTitle.text! = quizTitle!
        if (finishedCorrect / finishedTotal == 1) {
            desc = "Perfect! You have aced the quiz"
        } else {
            desc = "Almost! Please try again"
        }
        descriptFinished.text! = desc
        scoreFinished.text! = "You have answered \(finishedCorrect) correctly out of \(finishedTotal) questions"
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}