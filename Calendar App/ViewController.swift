//
//  ViewController.swift
//  Calendar App
//
//  Created by Zachary Hirn on 10/17/15.
//  Copyright © 2015 Zachary Hirn. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var selectedMonthInViewController = "January";
    

    var events = [("", "", "", "")]

    
    let devCourses =
    [
        ("January"),
        ("February"),
        ("March"),
        ("April"),
        ("May"),
        ("June"),
        ("July"),
        ("August"),
        ("September"),
        ("October"),
        ("November"),
        ("December")
    ]
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let arraySelector = indexPath.row
        selectedMonthInViewController = devCourses[arraySelector]
        performSegueWithIdentifier("goToSecondViewController", sender: nil)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return devCourses.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //This is the code provided in the tutorial, but does not work.
        /*
        var cell = UITableViewCell()
        cell.textLabel.text = "Hello"
        return cell
        */
        //This is the code that worked, instead of the code listed above.
        /*
        let cell = UITableViewCell()
        cell.textLabel!.text = "Hello"
        return cell
        */
        //This is the code we had before we added the dequeueing ability
        /*
        let cell = UITableViewCell()
        */
        var cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        
        //let (courseTitle, courseAuthor) = devCourses[indexPath.row]
        let (courseTitle) = devCourses[indexPath.row]
        
        cell.textLabel!.text = courseTitle
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "goToSecondViewController") {
            let svc = segue.destinationViewController as! SecondViewController;
            svc.selectedMonthInSecondViewController = selectedMonthInViewController;
            svc.events = events;
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //events += [("This String", "is here", "Today", "12:00")];
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

