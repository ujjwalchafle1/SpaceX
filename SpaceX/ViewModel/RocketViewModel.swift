//
//  RocketViewModel.swift
//  SpaceX
//
//  Created by Ujjwal on 27/03/2021.
//

import Foundation
import SwiftUI

class RocketViewModel: ObservableObject
{
  @Published var rockets:[Rocket] = []

  var service = RocketsService()
  
  init()
  {
    service.delegate = self
    service.getRocketsData()
  }
}

extension RocketViewModel: RocketssServiceDelegate {
  func didReciveResponse(response: Rockets) {
    DispatchQueue.main.async{
      self.rockets = response
    }
  }
  
  func didReciveError(error: String) {
    print(error)
  }
}
