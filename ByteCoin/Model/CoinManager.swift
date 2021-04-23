//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
  func didFailWithError(error: Error)
}

struct CoinManager {
  
  let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
  
  var delegate: CoinManagerDelegate?
  
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
  
  func performRequest(with urlString: String) {
    if let url = URL(string: urlString) {
      let session = URLSession(configuration: .default)
      let task = session.dataTask(with: url) { (data, response, error) in
        if error != nil {
//           self.delegate?.didFailWIthError(error: error!)
          return
        }
        
//        if let safeData = data {
//          if let weather = self.parseJSON(safeData) {
//             self.delegate?.didUpdateWeather(self, weather: weather)
//          }
//        }
      }
      task.resume()
    }
  }
  
  let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

}
