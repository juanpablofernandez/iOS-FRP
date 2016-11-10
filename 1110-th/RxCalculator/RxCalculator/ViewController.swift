//
//  ViewController.swift
//  RxCalculator
//
//  Created by Nikolas Burk on 09/11/16.
//  Copyright © 2016 Nikolas Burk. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    @IBOutlet weak var operationSegmentedControl: UISegmentedControl!
    @IBOutlet weak var firstValueTextField: UITextField!
    @IBOutlet weak var secondValueTextField: UITextField!
    @IBOutlet weak var operationLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    let calculator = Calculator()
    let disposeBag = DisposeBag()
    
    // MARK: View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let operationObservable: Observable<Calculator.Operation> = operationSegmentedControl.rx.value.map { value in
            return Calculator.Operation(rawValue: value)!
        }
        
        operationObservable.map { operation in
            return self.calculator.sign(for: operation)
            }.bindTo(operationLabel.rx.text)
            .addDisposableTo(disposeBag)
        
        let firstObservable: Observable<Int> = firstValueTextField.rx.text.map { string in
            return Int(string!)!
        }
        
        let secondObservable: Observable<Int> = secondValueTextField.rx.text.map { string in
            return Int(string!)!
        }
        
        let resultObservable = Observable.combineLatest(operationObservable, firstObservable, secondObservable) { operation, first, second -> Int in
            switch operation {
            case .addition: return self.calculator.add(a: first, b: second)
            case .subtraction:  return self.calculator.subtract(a: first, b: second)
            }
        }
        
        resultObservable.map { result in
            return String(result)
            }.bindTo(resultLabel.rx.text)
            .addDisposableTo(disposeBag)
    }
}

