//
//  ViewController.swift
//  ClassVsStruct
//
//  Created by Giresh Dora on 12/08/19.
//  Copyright © 2019 Giresh Dora. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        measureOperationTime(title: "Class") {
            var x = IntClass(0)
            for _ in 1...10000000{
                x = x + IntClass(1)
            }
        }
        
        measureOperationTime(title: "Struct") {
            var x = IntStruct(value: 0)
            for _ in 1...10000000{
                x = x + IntStruct(value: 1)
            }
        }
    }


    // MARK:- Custome methods
    
    func measureOperationTime(title: String, call: () -> Void){
        let startTime = CACurrentMediaTime()
        call()
        let endTime = CACurrentMediaTime()
        let finishTime = endTime - startTime
        print("\(title) Time taken: \(finishTime)")
    }
    
}


class IntClass{
    var value : Int
    init(_ value: Int) {
        self.value = value
    }
    
    static func + (x: IntClass, y: IntClass) -> IntClass {
        return IntClass(x.value + y.value)
    }
}


struct IntStruct {
    let value : Int
    
    static func + (x: IntStruct, y: IntStruct) -> IntStruct {
        return IntStruct(value: x.value + y.value)
    }
}
