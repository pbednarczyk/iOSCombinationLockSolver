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
    
    @IBOutlet weak var solveLabel0: UILabel?
    @IBOutlet weak var solveLabel1: UILabel?
    @IBOutlet weak var solveLabel2: UILabel?
    
    var lockSolver: LockSolver?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        XField?.becomeFirstResponder()
    }

    @IBAction func updateSolveLabel() {
        
        if  let x = Int((XField?.text)!),
            let y = Int((YField?.text)!),
            let z = Int((ZField?.text)!) {
            
            lockSolver = LockSolver(x: x, y: y, z: z)
            let solve = lockSolver!.solveThreeValues()
            
            solveLabel0!.text = "\(solve[0].rotation) \(solve[0].rWord) w \(solve[0].way ? "prawo" : "lewo") i na \(solve[0].number)"
            solveLabel1!.text = "\(solve[1].rotation) \(solve[1].rWord) w \(solve[1].way ? "prawo" : "lewo") i na \(solve[1].number)"
            solveLabel2!.text = "\(solve[2].rotation) \(solve[2].rWord) w \(solve[2].way ? "prawo" : "lewo") i na \(solve[2].number)"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }

}

