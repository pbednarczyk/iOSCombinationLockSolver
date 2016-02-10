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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        XField?.becomeFirstResponder()
    }

    @IBAction func updateSolveLabel() {
        
        let x = Int((XField?.text)!)!
        let y = Int((YField?.text)!)!
        let z = Int((ZField?.text)!)!
        
        let solve = solveThreeValues([x,y,z])
        
        solveLabel0!.text = "\(solve[0].rotation) \(solve[0].rWord) w \(solve[0].way ? "prawo" : "lewo") i na \(solve[0].number)"
        solveLabel1!.text = "\(solve[1].rotation) \(solve[1].rWord) w \(solve[1].way ? "prawo" : "lewo") i na \(solve[1].number)"
        solveLabel2!.text = "\(solve[2].rotation) \(solve[2].rWord) w \(solve[2].way ? "prawo" : "lewo") i na \(solve[2].number)"
        
    }
    
    func getRotationWord (rotation: Int) -> String{
        
        switch(rotation) {
        case 1:
            return "obrót";
        case 2,3,4:
            return "obroty";
        default:
            return "obrotów";
        }
    }
    
    func getSolutionData(nNumber: Int, lastNumber: Int, body: Int, way: Bool) -> (Int, String, Bool, Int){
  
        let rotation = Int(floor(Double(nNumber) / Double(body)))
        
        var number = (way ? lastNumber - nNumber : (lastNumber + nNumber)) % body
        
        if number < 0 {
            number += body
        }
        let rWord = getRotationWord(rotation)

        return  (rotation: rotation, rWord: rWord, way: way, number: number)
    
    }
    
    func solveThreeValues(numbers: [Int]) -> [(rotation: Int, rWord: String, way: Bool, number: Int)]  {
        
        // another informations
        let body = 40;
        let way = true;
        
        // solution
        var solution:[(rotation: Int, rWord: String, way: Bool, number: Int)] = []
        
        for var i = 0; i < numbers.count; i++ {
            solution += [getSolutionData(numbers[i], lastNumber: ((i > 0) ? solution[i-1].number : 0), body: body, way: ((i > 0) ? !solution[i-1].way : way))]
        }
        return solution
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }

}

