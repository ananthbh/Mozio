//
//  PatientDetails.swift
//  TestDemo
//
//  Created by Ananth Bhamidipati on 28/08/16.
//  Copyright © 2016 Ananth Bhamidipati. All rights reserved.
//

import UIKit
import CoreData

class PatientDetails: UIViewController {
    
    var people = [NSManagedObject]()
    var checkcount: Int = 0

    @IBOutlet var PatientName: UITextField!
    
    @IBOutlet var submitButton: UIButton!
    @IBOutlet var MigraneSwitch: UISwitch!
    
    @IBOutlet var AgeSwitch: UISwitch!
    
    @IBOutlet var genderSwitch: UISwitch!
    
    @IBOutlet var DrugsSwitch: UISwitch!
    
    @IBAction func MigSwitch(sender: UISwitch) {
        if (sender.on) {
            checkcount = checkcount + 1
        } else {
            checkcount = checkcount - 1
        }
    }
    
    @IBAction func AgSwitch(sender: UISwitch) {
        
        if (sender.on) {
            checkcount = checkcount + 1
        } else {
            checkcount = checkcount - 1
        }
    }
    
    @IBAction func GenSwitch(sender: UISwitch) {
        
        if (sender.on) {
            checkcount = checkcount + 1
        } else {
            checkcount = checkcount - 1
        }
    }
    
    @IBAction func DruSwitch(sender: UISwitch) {
        
        if (sender.on) {
            checkcount = checkcount + 1
        } else {
            checkcount = checkcount - 1
        }
    }
    
    @IBAction func Submit(sender: AnyObject) {
        ResultLabel.text = NSString(format: "%d percent chances of having Todd’s Syndrome", checkcount * 25) as String
        self.saveName(ResultLabel.text!)
        checkcount = 0
        
        PatientName.text = ""
        MigraneSwitch.on = false
        AgeSwitch.on = false
        genderSwitch.on = false
        DrugsSwitch.on = false
    }
    
    @IBOutlet var ResultLabel: UILabel!
    
    func saveName(name: AnyObject) {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let entity = NSEntityDescription.entityForName("PatientDetails", inManagedObjectContext: managedContext)
        let PatientDetails = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        PatientDetails.setValue(PatientName.text, forKey: "name")
        PatientDetails.setValue(ResultLabel.text, forKey: "result")
        PatientDetails.setValue(MigraneSwitch.on, forKey: "migrane")
        PatientDetails.setValue(AgeSwitch.on, forKey: "age")
        PatientDetails.setValue(genderSwitch.on, forKey: "male")
        PatientDetails.setValue(DrugsSwitch.on, forKey: "drugs")
        do {
            try managedContext.save()
        } catch let error as NSError{
            print("Could not save \(error)")
        }
    }
}
