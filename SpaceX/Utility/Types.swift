//
//  SSFlightList.swift
//  SpaceX
//
//  Created by Ujjwal on 17/03/2021.
//

import Foundation

// MARK: Http Method Type
enum MethodType {
  case POST
  case GET
}

// MARK: Success and Error scenarios Type
enum Result<T> {
  case Success(T)
  case Error(String)
}
