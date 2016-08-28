//
//  ViewController.swift
//  TestDemo
//
//  Created by Ananth Bhamidipati on 28/08/16.
//  Copyright © 2016 Ananth Bhamidipati. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, NSFetchedResultsControllerDelegate {
    
    var people = [NSManagedObject]()

    @IBOutlet var tableview: UITableView!
    @IBAction func AddDetail(sender: AnyObject) {
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedobject = appDelegate.managedObjectContext
        
        
        
        let fetchrequest = NSFetchRequest(entityName: "PatientDetails")
        do {
            let results = try managedobject.executeFetchRequest(fetchrequest)
            people = results as! [NSManagedObject]
        } catch {
            print("error")
        }
        tableview.reloadData()
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCellWithIdentifier("Cell") as! NameCell
        cell.nameLabel.text = people[indexPath.row].valueForKey("name") as? String
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ViewPatient" {
            let cell = sender as! NameCell
            let indexpath = tableview?.indexPathForCell(cell)
            let DestinationVC = segue.destinationViewController as!  PatientDetailsView
            
            DestinationVC.Name = people[(indexpath?.row)!].valueForKey("name") as? String
            DestinationVC.Result = people[(indexpath?.row)!].valueForKey("result") as? String
            DestinationVC.Migrane = people[(indexpath?.row)!].valueForKey("migrane") as? Bool
            DestinationVC.Age = people[(indexpath?.row)!].valueForKey("age") as? Bool
            DestinationVC.Gender = people[(indexpath?.row)!].valueForKey("male") as? Bool
            DestinationVC.Drugs = people[(indexpath?.row)!].valueForKey("drugs") as? Bool
    }
    }
}
