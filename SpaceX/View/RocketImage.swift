//
//  RocketImage.swift
//  SpaceX
//
//  Created by Ujjwal on 27/03/2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct RocketImage: View {
  
  @State var imageUrl = ""
  
  var body: some View {
    WebImage(url: URL(string: imageUrl))
      .onSuccess { image, data, cacheType in
      }
      .resizable()
      .placeholder(Image(systemName: "paperplane"))
      .placeholder {
        Rectangle().foregroundColor(.gray)
      }
      .indicator(.activity) // Activity Indicator
      .transition(.fade(duration: 0.5)) // Fade Transition with duration
      .scaledToFit()
  }
}
