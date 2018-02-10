//
//  SettingsViewController.swift
//  ComprasUSA
//
//  Created by Guilherme Bury on 09/02/2018.
//  Copyright © 2018 Guilherme Bury. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var textFieldDollar: UITextField!
    @IBOutlet weak var textFieldIOF: UITextField!
    @IBOutlet weak var textFieldTaxes: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldDollar.text = taxCalc.getFormattedValue(of: taxCalc.dollar, withCurrency: "")
        textFieldIOF.text = taxCalc.getFormattedValue(of: taxCalc.iof, withCurrency: "")
        textFieldTaxes.text = taxCalc.getFormattedValue(of: taxCalc.tax, withCurrency: "")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func setValues() {
        taxCalc.dollar = taxCalc.convertToDouble(textFieldDollar.text!)
        taxCalc.iof = taxCalc.convertToDouble(textFieldIOF.text!)
        taxCalc.tax = taxCalc.convertToDouble(textFieldTaxes.text!)
    }
}

extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        setValues()
    }
}
