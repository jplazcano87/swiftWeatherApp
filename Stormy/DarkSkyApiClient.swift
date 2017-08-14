//
//  DarkSkyApiClient.swift
//  Stormy
//
//  Created by Juan Pablo Lazcano Candia on 8/13/17.
//  Copyright © 2017 Spaceghost. All rights reserved.
//

import Foundation

class DarkSkyApiClient {
  
  fileprivate let apiKey = "---provide dark sky key-----"
  
  lazy var baseUrl: URL = {
    return URL(string: "https://api.darksky.net/forecast/\(self.apiKey)/")!
  }()
  
  let downloader = JsonDownloader()
  typealias CurrentWeatherCompletionHandler = (CurrentWeather?, DarkSkyError?)->Void
  
  func getCurrentWeather(at coordinate : Coordinate, completionHandler completion: @escaping CurrentWeatherCompletionHandler){
    guard let url = URL(string: coordinate.description, relativeTo: baseUrl) else{
      completion(nil, .invalidURL)
      return
    }
    let request = URLRequest(url: url)
    
    let task = downloader.jsonTask(with: request){ json, error in
      
      DispatchQueue.main.async {
        guard let json = json else{
          completion(nil, error)
          return
        }
        guard let currentWeatherJson = json["currently"] as? [String : AnyObject], let currentWeather = CurrentWeather(json: currentWeatherJson) else {
          completion(nil, .jsonParsingFailure)
          return
        }
        completion(currentWeather, nil)
      }
      
    }
    task.resume()
  }
  
  
}
