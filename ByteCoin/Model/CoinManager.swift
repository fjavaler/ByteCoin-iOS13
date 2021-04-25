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
  let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
  
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
    
    // Use String concatenation to add the selected currency at the end of the baseURL along with the API key.
    let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
    
    // Use optional binding to unwrap the URL that's created from the urlString.
    if let url = URL(string: urlString) {
      
      // Create a new URLSession object with default configuration.
      let session = URLSession(configuration: .default)
      
      // Create a new data task for the URLSession.
      let task = session.dataTask(with: url) { (data, response, error) in
        if error != nil {
           print(error!)
          return
        }
        
        if let safeData = data {
          let bitCoinPrice = self.parseJSON(safeData)
        }
      }
      // Start the task.
      task.resume()
    }
  }

  func parseJSON(_ data: Data) -> Double? {
    
    // Create a JSONDecoder
    let decoder = JSONDecoder()
    do {
      
      // Try to decode the data using the CoinData structure.
      let decodeData = try decoder.decode(CoinData.self, from: data)
      
      // Get the last property from the decoded data.
      let lastPrice = decodeData.rate
      print(lastPrice)
      return lastPrice
      
    } catch {
      
      // Catch and print any errors.
      print(error)
      return nil
    }
  }
}
