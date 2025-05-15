//
//  NavigationAction.swift
//  DessertDelights
//
//  Created by Mostafa Mahmoud on 22/03/2024.
//

import Foundation

public enum NavigationAction<ViewModelType>: Equatable where ViewModelType: Equatable {

  case present(view: ViewModelType)
  case presented(view: ViewModelType)
}
