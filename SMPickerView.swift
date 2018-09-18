//
//  SMPickerView.swift
//  SMPickerView
//
//  Created by Sihem MOHAMED on 06/04/2018.
//  Copyright © 2018 SIMO. All rights reserved.
//

import UIKit

protocol SMPickerViewDelegate: class {
    func pickerDidChanged(_ picker: SMPickerView)
}

@IBDesignable class SMPickerView: UIControl {
    
    private var buttonsView = UIView()
    private var picker : UIPickerView = UIPickerView()
    var selectedPickerValue:String = ""
    var font = UIFont(name: "Optima-Regular", size: 18)
    weak var delegate : SMPickerViewDelegate?
    var pickerData = [String]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupView()
    }
    
    override func prepareForInterfaceBuilder() {
        setupView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupView()
    }
    
    private func setupView() {
        setupPicker()
        setupButtonsView()
        
        self.insertSubview(picker, at: 0)
        self.insertSubview(buttonsView, at: 0)
        
    }
    
    private func setupButtonsView(){
        buttonsView.removeFromSuperview()
        let xPos = picker.frame.maxX
        let height = (frame.height-CGFloat(2))/2
        let width = height
        buttonsView = UIView(frame: CGRect(x: xPos, y: 0, width: width, height: frame.height))
        buttonsView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.7)
        
        let yPosDownBtn = height + CGFloat(2)
        let upButton : UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: width, height: height))
        let downButton : UIButton = UIButton(frame: CGRect(x: 0, y: yPosDownBtn, width: width, height: height))
        upButton.backgroundColor = UIColor.lightGray
        downButton.backgroundColor = UIColor.lightGray
        
        upButton.setImage(UIImage(named: "arrow-up"), for: .normal)
        downButton.setImage(UIImage(named: "arrow-down"), for: .normal)
        
        upButton.addTarget(self, action: #selector(upBtnTapped), for: .touchUpInside)
        downButton.addTarget(self, action: #selector(downBtnTapped), for: .touchUpInside)
        
        buttonsView.addSubview(upButton)
        buttonsView.addSubview(downButton)
        buttonsView.insertSubview(upButton, at: 0)
        buttonsView.insertSubview(downButton, at: 0)
        self.addSubview(buttonsView)
    }
    
    private func setupPicker() {
        picker.removeFromSuperview()
        let xPos = CGFloat(0)
        let width = frame.width - buttonsView.frame.width
        picker = UIPickerView(frame: CGRect(x: xPos, y: 0, width: width, height: frame.height))
        picker.backgroundColor = UIColor.lightGray.withAlphaComponent(0.7)
        picker.delegate = self
        picker.dataSource = self
        self.addSubview(picker)
        
    }
    
    @objc private func upBtnTapped(){
        let index:Int = picker.selectedRow(inComponent: 0)
        if index != -1 && index<(picker.numberOfRows(inComponent: 0)-1){
            picker.selectRow(index+1, inComponent: 0, animated: false)
            selectedPickerValue = pickerData[index+1]
            delegate?.pickerDidChanged(self)
        }
    }
    
    @objc private func downBtnTapped(){
        let index:Int = picker.selectedRow(inComponent: 0)
        if index != -1 && index>0{
            picker.selectRow(index-1, inComponent: 0, animated: false)
            selectedPickerValue = pickerData[index-1]
            delegate?.pickerDidChanged(self)
        }
    }
    
    func updatePickerDataSource() {
        picker.reloadAllComponents()
    }
    
}

extension SMPickerView: UIPickerViewDataSource, UIPickerViewDelegate{
    
    internal func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    internal func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    internal func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let value = pickerData[row]
        
        return value
    }
    
    internal func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return frame.height
    }
    
    internal func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
            
            let label = UILabel(frame: CGRect(x: 0, y: 0 , width: picker.frame.width, height: frame.height))
            label.textColor = .white
            label.textAlignment = .center
            label.text = pickerData[row]
            label.font = font
            return label
        }
    
    internal func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerData.count > 0{
            selectedPickerValue = pickerData[row]
            delegate?.pickerDidChanged(self)
        }
    }
    
}
