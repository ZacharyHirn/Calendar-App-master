//
//  FourthViewController.swift
//  Calendar App
//
//  Created by Zachary Hirn on 10/26/15.
//  Copyright © 2015 Zachary Hirn. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {
    
    var selectedMonthInFourthViewController:String!;
    var selectedDayInFourthViewController:String!;
    var events:[(String, String, String, String)]!;

    
    @IBAction func deleteButton(sender: AnyObject) {
        performSegueWithIdentifier("goBackToThirdViewController", sender: nil)
    }
    @IBOutlet weak var eventName: UILabel!
    
    var selectedEvent = [("This", "Is", "the", "setup")];
    var arrayIndex:Int!;

    override func viewDidLoad() {
        super.viewDidLoad()
        eventName.text = "Delete this event?";

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "goBackToThirdViewController") {
            let svc = segue.destinationViewController as! ThirdViewController;
            events.removeAtIndex(arrayIndex);
            svc.selectedMonthInThirdViewController = selectedMonthInFourthViewController;
            svc.selectedDayInThirdViewController = selectedDayInFourthViewController;
            svc.events = events;
            /*
            svc.selectedMonthInThirdViewController = selectedMonthInSecondViewController;
            svc.selectedDayInThirdViewController = selectedDayInSecondViewController;
            */
        }
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
