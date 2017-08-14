//
//  DarkSkyError.swift
//  Stormy
//
//  Created by Juan Pablo Lazcano Candia on 8/13/17.
//  Copyright © 2017 Spaceghost. All rights reserved.
//

import Foundation

enum DarkSkyError: Error {
  case requestFailed
  case responseUnsuccesful
  case invalidData
  case jsonConvertionFailure
  case invalidURL
  case jsonParsingFailure
}
