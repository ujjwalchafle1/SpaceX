//
//  RocketDetails.swift
//  SpaceX
//
//  Created by Ujjwal on 27/03/2021.
//

import SwiftUI

struct RocketDetails: View {
  
  @Environment(\.openURL) var openURL
  
  @State var rocket:Rocket!
  
  var body: some View
  {
    List
    {
      Text(rocket.name)
        .font(.system(size: 25))
        .fontWeight(.heavy)
        .padding(.bottom,2)
      
      Text(rocket.rocketDescription)
      
      VStack {
        RocketImage(imageUrl: rocket.flickrImages[0])
      }
      
      rowWith(label:"Cost Per FLight:", value:rocket.amountInUSD)
      rowWith(label:"First Flight:", value:rocket.formatedFirstFlightDate)
      
      VStack
      {
        rowWith(label:"Success Rate", value:"\(rocket.successRatePct)%")
        
        ProgressView(value:Float(rocket.successRatePct), total:100)
          .accentColor(rocket.badgeColor)
          .scaleEffect(x: 1, y: 4, anchor: .center)
          .padding(.bottom)
      }
      
      rowWith(label:"Status:", value:rocket.active ? "Active":"In-active")
      rowWith(label:"Country:", value:rocket.country)
      
      Button("Click here to read more on wikipedia") {
        openURL(URL(string: rocket.wikipedia)!)
      }
      .foregroundColor(.blue)
    }
  }
  
  fileprivate func rowWith(label:String, value:String) -> HStack<TupleView<(Text, Spacer, Text)>> {
    return HStack
    {
      Text(label)
      Spacer()
      Text(value)
    }
  }
}

