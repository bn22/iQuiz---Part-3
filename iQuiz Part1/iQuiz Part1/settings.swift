//
//  settings.swift
//  iQuiz Part1
//
//  Created by Bruce Ng on 11/19/15.
//  Copyright © 2015 Bruce Ng. All rights reserved.
//

import Foundation
import UIKit

class settings: UIViewController {

    @IBOutlet weak var urlEntry: UITextField!
    @IBOutlet weak var HTTP: UIButton!
    @IBOutlet weak var saved: UILabel!
    var url : String = " "
    var savedQuiz : [Dictionary <String, AnyObject>] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        urlEntry.text = "http://tednewardsandbox.site44.com/questions.json"
        saved.hidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var DestV : ViewController = segue.destinationViewController as! ViewController
    }
    
    @IBAction func update(sender: AnyObject) {
        url = urlEntry.text!
        httpGet(url)
        saved.hidden = false
    }
    
    
    func httpGet(url : String) {
        let urlPath: NSURL = NSURL(string: url)!
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(urlPath, completionHandler: {data, response, error -> Void in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                var err: NSError?
                do{
                    self.savedQuiz = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! [Dictionary<String, AnyObject>]
                    let defaults = NSUserDefaults.standardUserDefaults()
                    defaults.setObject(self.savedQuiz, forKey: "quizData")
                }catch{
                
                }
            }
        })
        task.resume()
    }
}