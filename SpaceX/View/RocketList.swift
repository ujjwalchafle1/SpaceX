//
//  ContentView.swift
//  SpaceX
//
//  Created by Ujjwal on 27/03/2021.
//

import SwiftUI

struct RocketList: View {
  
  @Environment(\.colorScheme) var colorScheme
  @ObservedObject var viewModel: RocketViewModel
  
  init(vm: RocketViewModel = RocketViewModel()) {
    viewModel = vm
  }
  
  var body: some View
  {
    NavigationView
    {
      List
      {
        ForEach(viewModel.rockets, id: \.id) { rocket in
          Section()
          {
            GroupBox
            {
              NavigationLink(destination: RocketDetails(rocket: rocket)) {
                ZStack {
                  RocketCell(rocket:rocket)
                }
                .foregroundColor(colorScheme == .dark ? .white:.black)
              }
            }
          }
        }
      }
      .navigationTitle("Rockets")
    }
  }
}
