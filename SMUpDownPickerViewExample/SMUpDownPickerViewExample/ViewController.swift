//
//  ViewController.swift
//  SMUpDownPickerViewExample
//
//  Created by Sihem MOHAMED on 18/09/2018.
//  Copyright © 2018 SIMO. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SMPickerViewDelegate{

    @IBOutlet weak var pickerView: SMPickerView!
    @IBOutlet weak var selectedValue: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.pickerData = ["Apple", "Banana", "Lemon", "Abricot"]
        selectedValue.text = pickerView.pickerData[0]
    }

    func pickerDidChanged(_ picker: SMPickerView) {
        self.selectedValue.text = picker.selectedPickerValue
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

