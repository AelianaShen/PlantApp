//
//  ARView+Extensions.swift
//  PlantApp
//
//  Created by Aeliana Shen on 11/21/23.
//

import Foundation
import ARKit
import RealityKit

extension ARView {
    
    func addCoachingOverlay() {
        let coachingView = ARCoachingOverlayView()
        coachingView.goal = .horizontalPlane
        coachingView.session = self.session
        coachingView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(coachingView)
    }
}
