//
//  SecondViewController.swift
//  Calendar App
//
//  Created by Zachary Hirn on 10/17/15.
//  Copyright © 2015 Zachary Hirn. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var events:[(String, String, String, String)]!;
        
    var selectedMonthInSecondViewController:String!;
    var selectedDayInSecondViewController = "day";
    
    let devCourses =
    [
        ("1st"), ("2nd"), ("3rd"), ("4th"), ("5th"), ("6th"), ("7th"), ("8th"), ("9th"), ("10th"), ("11th"), ("12th"), ("13th"), ("14th"), ("15th"), ("16th"), ("17th"), ("18th"), ("19th"), ("20th"), ("21st"), ("22nd"), ("23rd"), ("24th"), ("25th"), ("26th"), ("27th"), ("28th"), ("29th"), ("30th"), ("31st")
    ]
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let arraySelector = indexPath.row
        selectedDayInSecondViewController = devCourses[arraySelector]
        performSegueWithIdentifier("goToThirdViewController", sender: nil)
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(selectedMonthInSecondViewController == "January" || selectedMonthInSecondViewController == "March" || selectedMonthInSecondViewController == "May" || selectedMonthInSecondViewController == "July" || selectedMonthInSecondViewController == "August" || selectedMonthInSecondViewController == "October" || selectedMonthInSecondViewController == "December")
        {
            return 31;
        }
        else if(selectedMonthInSecondViewController == "April" || selectedMonthInSecondViewController == "June" || selectedMonthInSecondViewController == "September" || selectedMonthInSecondViewController == "November")
        {
            return 30;
        }
        else //we have February
        {
            return 28;
        }
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
        var cell = tableView.dequeueReusableCellWithIdentifier("cellTwo", forIndexPath: indexPath) as UITableViewCell
        
        let day = devCourses[indexPath.row]
        
        cell.textLabel!.text = day
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "goToThirdViewController") {
            let svc = segue.destinationViewController as! ThirdViewController;
            svc.selectedMonthInThirdViewController = selectedMonthInSecondViewController;
            svc.selectedDayInThirdViewController = selectedDayInSecondViewController;
            svc.events = events;
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
