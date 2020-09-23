//
//  ViewController.swift
//  CalculatorPractice
//
//  Created by Tai Chin Huang on 2020/9/23.
//

import UIKit

class ViewController: UIViewController {
    //設定第一、第二跟總和的變數，因為會有小數點的出現，所以型別用double，設為optional是因為會有nil的可能
    var first: Double? = 0
    var second: Double? = 0
    var sum: Double? = 0
    //設定第一數字、第二數字的textfield,calculateSegment跟warning、answer的label
    @IBOutlet weak var firstNumberTextField: UITextField!
    @IBOutlet weak var secondNumberTextField: UITextField!
    @IBOutlet weak var calculateSegment: UISegmentedControl!
    @IBOutlet weak var warningLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //一開始先把warningLabel給隱藏起來
        warningLabel.isHidden = true
    }
    //設定計算方式
    func calculation() {
        //利用selectedSegmentIndex來判定所選是+/-/x/÷
        let segmentSelect = calculateSegment.selectedSegmentIndex
        switch segmentSelect {
        case 0:
            //因為是optional，記得用！來unwrap
            sum = first! + second!
        case 1:
            sum = first! - second!
        case 2:
            sum = first! * second!
        default:
            sum = first! / second!
        }
        //最後answerLabel會將結果顯示到小數點第二位
        answerLabel.text = String(format: "%.2f", sum!)
    }
    //由使用者輸入的值來回傳給firstNumberTextField的text
    @IBAction func firstNumber(_ sender: UITextField) {
        firstNumberTextField.text = sender.text
    }
    
    @IBAction func secondNumber(_ sender: UITextField) {
        secondNumberTextField.text = sender.text
    }
    //透過calculateButton來實現計算並顯示結果
    @IBAction func calculateButton(_ sender: UIButton) {
        first = Double(firstNumberTextField.text!) // Double("") 生成的東西有可能是 nil，所以下面要加 if... 判斷式，確保不會閃退
        second = Double(secondNumberTextField.text!)
        //兩個欄位都要輸入才能做計算！
        if first != nil && second != nil {
            warningLabel.isHidden = true
            calculation()
        } else {
            //若缺任何一個數值warningLabel就會顯示
            warningLabel.isHidden = false
            warningLabel.text = "Please fill the number in both two!"
        }
    }
    //當點擊鍵盤外面就可以將鍵盤收起來
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

