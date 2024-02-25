//
//  RoundedShape.swift
//  HackIllinoisApp
//
//  Created by Soumil Rathi on 24/02/24.
//

import Foundation
import SwiftUI


struct RoundedShape: Shape {
    var corners: UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: 100, height: 50))
        
        return Path(path.cgPath)
    }
}
