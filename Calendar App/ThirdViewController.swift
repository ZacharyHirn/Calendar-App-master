//
//  ThirdViewController.swift
//  Calendar App
//
//  Created by Zachary Hirn on 10/17/15.
//  Copyright © 2015 Zachary Hirn. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var arraySelector = 0;
    
    var events:[(String, String, String, String)]!;
    
    var selectedEvent = [("This", "Is", "the", "setup")];
    
    var selectedMonthInThirdViewController:String!;
    var selectedDayInThirdViewController:String!;
    var eventTitle:String = "";
    var eventTime:String = "";
    //This will display when your creating event will happen
    @IBOutlet weak var eventDate: UILabel!
    //This will display events happening on this day already
    @IBOutlet weak var eventTitleTextField: UITextField!
    
    @IBAction func addEventButton(sender: UIButton) {
        eventTitle = eventTitleTextField.text!;
        //var selectedMonth = "";
        //selectedMonth = selectedMonthInThirdViewController;
        //var selectedDay = "";
        //selectedDay = selectedDayInThirdViewController;
        //var arrayToAdd = [(selectedMonth, selectedDay, eventTitle, eventTime)];
        //events += arrayToAdd;
        //events +=[(selectedMonth, selectedDay, eventTitle, eventTime)];
        performSegueWithIdentifier("goToViewController", sender: nil)
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        arraySelector = indexPath.row
        //var selectedMonth = "";
        //selectedMonth = selectedMonthInThirdViewController;
        //var selectedDay = "";
        //selectedDay = selectedDayInThirdViewController;
        //selectedEvent = events[arraySelector];
        performSegueWithIdentifier("goToFourthViewController", sender: nil)
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
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
        var cell = tableView.dequeueReusableCellWithIdentifier("cellThree", forIndexPath: indexPath) as UITableViewCell
        
        //let (courseTitle, courseAuthor) = devCourses[indexPath.row]
        let (Month, Day, eventName, eventTime) = events[indexPath.row]
        
        for i in 1...events.count
        {
            //Here is where we would put code to determine if we should display the event or not.
        }
        cell.textLabel!.text = (Month + " " + Day + " " + eventName + eventTime)
        return cell
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "goToViewController") {
            let svc = segue.destinationViewController as! ViewController;
            svc.events = events;
            svc.events.append((selectedMonthInThirdViewController, selectedDayInThirdViewController, eventTitle, eventTime))
            /*
            svc.selectedMonthInThirdViewController = selectedMonthInSecondViewController;
            svc.selectedDayInThirdViewController = selectedDayInSecondViewController;
            */
        }
        else if(segue.identifier == "goToFourthViewController"){
            let svc = segue.destinationViewController as! FourthViewController;
            svc.selectedEvent = selectedEvent;
            svc.arrayIndex = arraySelector;
            //We need this
            svc.selectedMonthInFourthViewController = selectedMonthInThirdViewController;
            svc.selectedDayInFourthViewController = selectedDayInThirdViewController;
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
