//
//  CreaturesDataStructures.swift
//  CatchEmAll
//
//  Created by Richard Gagg on 7/3/2025.
//

import Foundation

@Observable // Will watch object for changes so that Swift will redraw the veiws when needed
class Cretrures {
  
  private struct ReturnedData: Codable {
    var count: Int
    var next: String
    var results: [Result]
  }
  
  struct Result: Codable, Hashable {
    var name: String
    var url: String // URL for accessing Pokemon detail
  }
  
  var urlString = "https://pokeapi.co/api/v2/pokemon/"
  var count = 0
  var creaturesArray: [Result] = []
  
  func getData() async {
    print("🕸️ We are saccessing the url \(urlString)")
    
    // Create URL
    guard let url = URL(string: urlString) else {
      print("🤬 ERROR: Could not ceate url from \(urlString)")
      return
    }
    
    // Get data from URL
    do {
      let (data, _) = try await URLSession.shared.data(from: url)
      
      // Try to decode JSON data into our own data structure
      guard let returnedData = try? JSONDecoder().decode(ReturnedData.self, from: data) else {
        print("🤬 JSON ERROR: Could not decode returned JSON data.")
        return
      }
      print("😎 JSON returned - count: \(returnedData.count), next: \(returnedData.next)")
      self.count = returnedData.count
      self.urlString = returnedData.next
      self.creaturesArray = returnedData.results
      
    } catch {
      print("🤬 ERROR: Could not get data from \(urlString)")
    }
  }
}
