//
//  SSFlightList.swift
//  SpaceX
//
//  Created by Ujjwal on 17/03/2021.
//

import Foundation

/// Protocol to notify Success or Failure of the API call
protocol RocketssServiceDelegate {
  func didReciveResponse(response: Rockets)
  func didReciveError(error: String)
}

/// ViewModel for handling the data required for   view
struct RocketsService
{
  var delegate:RocketssServiceDelegate?
  
  /// Function to make API call to get the  flight data
  func getRocketsData()
  {
    let network = NetworkManager()
    network.getData(method: .GET, endpoint: .rocketsData, dictionary: nil, type: Rockets.self) { (result) in
      switch result {
      case .Success(let result):
        delegate?.didReciveResponse(response: result)
      case .Error(let error):
        delegate?.didReciveError(error: error)
      }
    }
  }
}
