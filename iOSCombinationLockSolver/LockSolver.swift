//
//  LockSolver.swift
//  iOSCombinationLockSolver
//
//  Created by Pawel Bednarczyk on 11.02.2016.
//  Copyright © 2016 Pawel Bednarczyk. All rights reserved.
//

import Foundation

class LockSolver {

    let x:Int
    let y:Int
    let z:Int
    
    init(x: Int, y: Int, z: Int) {
        self.x = x
        self.y = y
        self.z = z
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
    
    func solveThreeValues() -> [(rotation: Int, rWord: String, way: Bool, number: Int)]  {
        
        // another informations
        let body = 40;
        let way = true;
        
        let numbers = [x,y,z]
        
        // solution
        var solution:[(rotation: Int, rWord: String, way: Bool, number: Int)] = []
        
        for var i = 0; i < numbers.count; i++ {
            solution += [getSolutionData(numbers[i], lastNumber: ((i > 0) ? solution[i-1].number : 0), body: body, way: ((i > 0) ? !solution[i-1].way : way))]
        }
        return solution
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
}