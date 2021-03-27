//
//  SSFlightList.swift
//  SpaceX
//
//  Created by Ujjwal on 17/03/2021.
//

import Foundation

/// Use this enum to create base url and endpoint path
/// Add additional cases for future API services
enum SpaceXAPI {
  case rocketsData
}

/// Create base url and path components based on the enum case.
extension SpaceXAPI: EndpointType
{
  var baseURL: URL {
    switch self {
    case .rocketsData :
      return URL(string: "https://api.spacexdata.com/")!
    }
  }
  
  var path: String {
    switch self {
    case .rocketsData :
      return "v4/rockets"
    }
  }
  
}
