//
//  AppModel.swift
//  nodes-demo
//
//  Created by Олег Комаристый on 18.11.2025.
//

import SwiftUI
import Observation
import RealityKit

@MainActor
@Observable
final class AppModel: Sendable {
    var nodes: [Node] = []
    
    
    init() {
        self.nodes = MockData.nodes
    }
}
