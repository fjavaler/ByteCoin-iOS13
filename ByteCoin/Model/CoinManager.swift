//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct CoinManager {
  
  let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
  
  // Computed property for API Key.
  private var apiKey: String {
    get {
      // Get filePath of hidden .plist file.
      guard let filePath = Bundle.main.path(forResource: "CoinAPI", ofType: "plist") else {
        fatalError("Couldn't find file 'CoinAPI.plist'.")
      }
      
      // Store contents of file in a variable as an dictionary.
      let plist = NSDictionary(contentsOfFile: filePath)
      
      // Retrieve value associated with key in dictionary and store.
      guard let value = plist?.object(forKey: "API_KEY") as? String else {
        fatalError("Couldn't find key 'API_KEY' in 'CoinAPI.plist'.")
      }
      
      // return the value.
      return value
    }
  }
  
  func getCoinPrice(for currency: String) {
    
  }
  
  let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
  
  
}
