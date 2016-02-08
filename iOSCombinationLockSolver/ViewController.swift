//
//  ViewController.swift
//  iOSCombinationLockSolver
//
//  Created by Pawel Bednarczyk on 08.02.2016.
//  Copyright © 2016 Pawel Bednarczyk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var XField: UITextField?
    @IBOutlet weak var YField: UITextField?
    @IBOutlet weak var ZField: UITextField?
    
    @IBOutlet weak var solveLabel: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        XField?.becomeFirstResponder()
    }

    @IBAction func updateSolveLabel() {
        solveLabel?.text = "2 turns to the right, then to the 13, 1 turn left, to the 35, and then right again to the 18"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

