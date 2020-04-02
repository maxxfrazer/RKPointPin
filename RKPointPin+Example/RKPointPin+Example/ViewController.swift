//
//  ViewController.swift
//  RKPointPin+Example
//
//  Created by Max Cobb on 4/1/20.
//  Copyright © 2020 Max Cobb. All rights reserved.
//

import UIKit
import RealityKit

class ViewController: UIViewController {

  var arView = ARView(frame: .zero)
  var rkPin: RKPointPin?
  override func viewDidLoad() {
    super.viewDidLoad()

    arView.frame = self.view.bounds
    self.arView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

    let rootAnchor = AnchorEntity(world: [0, 0, -1])

    let boxEntity = ModelEntity(
      mesh: .generateBox(size: 0.1),
      materials: [SimpleMaterial(color: .cyan, isMetallic: false)]
    )

    rootAnchor.addChild(boxEntity)

    // Add the box anchor to the scene
    self.arView.scene.addAnchor(rootAnchor)
    let rkPin = RKPointPin()
    rkPin.arView = self.arView
    rkPin.targetEntity = boxEntity
    rkPin.cutoffPercentage = 0.5
    self.arView.addSubview(rkPin)
    self.rkPin = rkPin
    self.view.addSubview(self.arView)

  }
}
