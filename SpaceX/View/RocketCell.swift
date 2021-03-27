//
//  RocketCell.swift
//  SpaceX
//
//  Created by Ujjwal on 27/03/2021.
//

import SwiftUI

struct RocketCell: View {
  
  @State var rocket:Rocket!
  
  var body: some View {
    VStack
    {
      RocketImage(imageUrl: rocket.flickrImages[0])
      
      VStack
      {
        Text(rocket.name)
          .font(.system(size: 25))
          .fontWeight(.heavy)
          .padding(.bottom,2)
        Text("First Flight - "+rocket.formatedFirstFlightDate)
        Divider()
        HStack{
          Text("Success Rate")
          Spacer()
          Text("\(rocket.successRatePct)%")
        }
        ProgressView(value:Float(rocket.successRatePct), total:100)
          .accentColor(rocket.badgeColor)
          .scaleEffect(x: 1, y: 4, anchor: .center)
      }
    }
  }
}
