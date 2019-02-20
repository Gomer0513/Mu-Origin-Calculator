//
//  FloatExtension.swift
//  Mu Origin Calculator
//
//  Created by Oleksandr Kysil on 2/20/19.
//  Copyright © 2019 Oleksandr Kysil. All rights reserved.
//

import Foundation

extension Float {
  func roundToInt() -> Int {
    let value = Int(self)
    let f = self - Float(value)
    if f >= 0.00000000001 {
      return value + 1
    } else {
      return value
    }
  }
}
