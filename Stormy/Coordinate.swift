//
//  Coordinate.swift
//  Stormy
//
//  Created by Juan Pablo Lazcano Candia on 8/13/17.
//  Copyright © 2017 Spaceghost. All rights reserved.
//

import Foundation

struct Coordinate {
  let latitude : Double
  let longitude : Double
}
extension Coordinate : CustomStringConvertible{
  var description: String{
    return "\(latitude),\(longitude)"
  }
}
