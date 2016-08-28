//
//  PatientDetailsView.swift
//  TestDemo
//
//  Created by Ananth Bhamidipati on 28/08/16.
//  Copyright © 2016 Ananth Bhamidipati. All rights reserved.
//

import UIKit
import CoreData

class PatientDetailsView: UIViewController {
    
    var Name: String!
    var Result: String!
    var Migrane: Bool!
    var Age: Bool!
    var Gender: Bool!
    var Drugs: Bool!
    
    @IBOutlet var NameLabel: UILabel!
    @IBOutlet var MigraneSwitch: UISwitch!
    @IBOutlet var AgeSwitch: UISwitch!
    @IBOutlet var GenderSwitch: UISwitch!
    @IBOutlet var DrugsSwitch: UISwitch!
    @IBOutlet var LabelResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MigraneSwitch.on = Migrane
        AgeSwitch.on = Age
        GenderSwitch.on = Gender
        DrugsSwitch.on = Drugs
        NameLabel.text = "\(Name)'s Medical Report"
        LabelResult.text = Result
        
        MigraneSwitch.enabled = false
        AgeSwitch.enabled = false
        GenderSwitch.enabled = false
        DrugsSwitch.enabled = false
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
     

    }
    
}
