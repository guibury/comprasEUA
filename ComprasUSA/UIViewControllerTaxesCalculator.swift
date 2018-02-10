//
//  UIViewControllerTaxesCalculator.swift
//  ComprasUSA
//
//  Created by Guilherme Bury on 10/02/2018.
//  Copyright © 2018 Guilherme Bury. All rights reserved.
//

import UIKit

extension UIViewController {
    var taxCalc: TaxesCalculator {
        return TaxesCalculator.instance
    }
}
