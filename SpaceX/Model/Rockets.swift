//
//  SSFlightList.swift
//  SpaceX
//
//  Created by Ujjwal on 17/03/2021.
//

import Foundation
import SwiftUI

// MARK: - Rocket
struct Rocket: Codable
{
  let flickrImages: [String]
  let name: String
  let successRatePct: Int
  let firstFlight, country, company: String
  let wikipedia: String
  let rocketDescription, id: String
  let active: Bool
  let costPerLaunch: Int
  
  enum CodingKeys: String, CodingKey
  {
    case flickrImages = "flickr_images"
    case name
    case successRatePct = "success_rate_pct"
    case firstFlight = "first_flight"
    case country, company, wikipedia
    case rocketDescription = "description"
    case id
    case active
    case costPerLaunch = "cost_per_launch"
  }
}

typealias Rockets = [Rocket]

extension Rocket
{
  var formatedFirstFlightDate: String
  {
    get {
      let dateFormatterGet = DateFormatter()
      dateFormatterGet.dateFormat = "yyyy-MM-dd"
      
      let dateFormatterPrint = DateFormatter()
      dateFormatterPrint.dateFormat = "MMM dd, yyyy"
      
      if let date = dateFormatterGet.date(from: firstFlight) {
        return dateFormatterPrint.string(from: date)
      }
      return ""
    }
  }
  
  var amountInUSD: String {
    get
    {
      let formatter = NumberFormatter()
      formatter.locale = Locale.current // Change this to another locale if you want to force a specific locale, otherwise this is redundant as the current locale is the default already
      formatter.numberStyle = .currencyAccounting
      if let formattedTipAmount = formatter.string(from: costPerLaunch as NSNumber) {
        return "\(formattedTipAmount)"
      }
      return ""
    }
  }
  
  var badgeColor: Color {
    get {
      if successRatePct >= 60 {
        return .green
      } else if successRatePct <= 29 {
        return .red
      } else {
        return .orange
      }
    }
  }
}
