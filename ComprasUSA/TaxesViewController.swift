//
//  TaxesViewController.swift
//  ComprasUSA
//
//  Created by Guilherme Bury on 09/02/2018.
//  Copyright © 2018 Guilherme Bury. All rights reserved.
//

import UIKit

class TaxesViewController: UIViewController {

    @IBOutlet weak var labelDollar: UILabel!
    @IBOutlet weak var labelTaxDescription: UILabel!
    @IBOutlet weak var labelTax: UILabel!
    @IBOutlet weak var labelIOFDescription: UILabel!
    @IBOutlet weak var labelIOF: UILabel!
    @IBOutlet weak var switchCreditCard: UISwitch!
    @IBOutlet weak var labelReal: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        calculateTaxes()
    }

    @IBAction func changeIOF(_ sender: UISwitch) {
        calculateTaxes()
    }

    func calculateTaxes() {
        labelTaxDescription.text = "Imposto do estado (\(taxCalc.getFormattedValue(of: taxCalc.tax, withCurrency: ""))%)"
        labelIOFDescription.text = "I.O.F. (\(taxCalc.getFormattedValue(of: taxCalc.iof, withCurrency: ""))%)"
        
        labelDollar.text = taxCalc.getFormattedValue(of: taxCalc.shoppingValue, withCurrency: "US$ ")
        labelTax.text = taxCalc.getFormattedValue(of: taxCalc.taxValue, withCurrency: "US$ ")
        labelIOF.text = taxCalc.getFormattedValue(of: taxCalc.iofValue, withCurrency: "US$ ")
        
        let real = taxCalc.calculate(usingCreditCard: switchCreditCard.isOn)
        labelReal.text = taxCalc.getFormattedValue(of: real, withCurrency: "R$ ")
    }
}
