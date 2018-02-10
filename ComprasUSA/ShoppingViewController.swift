//
//  ViewController.swift
//  ComprasUSA
//
//  Created by Guilherme Bury on 09/02/2018.
//  Copyright © 2018 Guilherme Bury. All rights reserved.
//

import UIKit

class ShoppingViewController: UIViewController {

    
    @IBOutlet weak var textFieldDollar: UITextField!
    @IBOutlet weak var labelRealDescription: UILabel!
    @IBOutlet weak var labelReal: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setAmmount()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textFieldDollar.resignFirstResponder()
        setAmmount()
    }
    
    func setAmmount() {
        taxCalc.shoppingValue = taxCalc.convertToDouble(textFieldDollar.text!)
        labelReal.text = taxCalc.getFormattedValue(of: taxCalc.shoppingValue * taxCalc.dollar, withCurrency: "R$ ")
        let dollar = taxCalc.getFormattedValue(of: taxCalc.dollar, withCurrency: "")
        labelRealDescription.text = "Valor sem impostos (dólar \(dollar))"
    }
}

