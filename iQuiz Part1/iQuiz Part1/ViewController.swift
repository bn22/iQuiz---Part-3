//
//  ViewController.swift
//  iQuiz Part1
//
//  Created by Bruce Ng on 11/3/15.
//  Copyright © 2015 Bruce Ng. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    let cellTableIdentifier = "subjectCell"
    let photosDict : Dictionary<String, String> =
        ["Mathematics" : "photo1.png", "Marvel Super Heroes" : "photo2.png", "Science!" : "photo3.png"]
    var questionsArray : NSMutableArray = []
    var quizName : String = " "
    var jsonData: [Dictionary<String, AnyObject>] = []
    var urlString : String = "http://tednewardsandbox.site44.com/questions.json"
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let backView = UIView(frame: CGRectZero)
        self.tableView.tableFooterView = backView
        let defaullts = NSUserDefaults.standardUserDefaults()
        if let jsonData = defaullts.arrayForKey("quizData") {
            self.jsonData = jsonData as! [Dictionary<String, AnyObject>]
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jsonData.count
    }
    
    func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath)
        -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellTableIdentifier, forIndexPath: indexPath) as! subjectCell
        let rowData = jsonData[indexPath.row]
        cell.title = String(rowData["title"]!)
        cell.descript = String(rowData["desc"]!)
        cell.imageLabel?.image = UIImage(named: photosDict[String(rowData["title"]!)]!)
        cell.subject = "Subject:"
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("You selected cell \(indexPath.row)!")
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "popover") {
            let Des : settings = segue.destinationViewController as! settings
        } else {
            let indexPath : NSIndexPath? = self.tableView.indexPathForSelectedRow
            quizName = String(jsonData[indexPath!.row]["title"]!)
            questionsArray = jsonData[indexPath!.row]["questions"]! as! NSMutableArray
            let DestViewController : questions = segue.destinationViewController as! questions
            DestViewController.quizT = quizName
            DestViewController.questionsAnswerArray = questionsArray
            DestViewController.count = 0
            DestViewController.correct = 0
            DestViewController.total = questionsArray.count
        }
    }
}

