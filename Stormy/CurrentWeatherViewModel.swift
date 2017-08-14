//
//  CurrentWeatherViewModel.swift
//  Stormy
//
//  Created by Juan Pablo Lazcano Candia on 8/11/17.
//  Copyright © 2017 Spaceghost. All rights reserved.
//

import Foundation
import UIKit

struct CurrentWeatherViewModel {
  let temperature : String
  let humidity : String
  let precipitationProbability : String
  let summary : String
  let icon : UIImage
  
  
  //T(°C) = (T(°F) - 32) × 5/9
  init(model : CurrentWeather) {
    let roundedTemperature = Int(((model.temperature-32)*5)/9)
    self.temperature = "\(roundedTemperature)º"
    let humidityPercentValue = Int(model.humidity * 100)
    self.humidity = "\(humidityPercentValue)%"
    let precipitPercentValue = Int(model.precipitationProbability * 100)
    self.precipitationProbability = "\(precipitPercentValue)%"
    self.summary = model.summary
    let weatherIcon = WeatherIcon(iconString: model.icon)
    self.icon = weatherIcon.image
  }

}
