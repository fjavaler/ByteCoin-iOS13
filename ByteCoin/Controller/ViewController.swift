//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
  
  let coinManager = CoinManager()
  
  // Number of columns to display in picker view.
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  
  // Number of rows to display in picker view.
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return coinManager.currencyArray.count
  }
  
  // Sets name of row
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return coinManager.currencyArray[row]
  }
  
  // Gets the coin price for the currency type
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    coinManager.getCoinPrice(for: coinManager.currencyArray[row])
  }
  
  @IBOutlet weak var bitcoinLabel: UILabel!
  @IBOutlet weak var currencyLabel: UILabel!
  @IBOutlet weak var currencyPicker: UIPickerView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    currencyPicker.dataSource = self
    currencyPicker.delegate = self
  }
  
}
