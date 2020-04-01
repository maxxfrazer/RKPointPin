//
//  UIImage+Extensions.swift
//  RKPointPin
//
//  Created by Max Cobb on 4/1/20.
//

import UIKit

internal extension UIImage {
  func tinted(color: UIColor) -> UIImage? {
    let image = withRenderingMode(.alwaysTemplate)
    let imageView = UIImageView(image: image)
    imageView.tintColor = color

    UIGraphicsBeginImageContextWithOptions(image.size, false, 0.0)
    if let context = UIGraphicsGetCurrentContext() {
      imageView.layer.render(in: context)
      let tintedImage = UIGraphicsGetImageFromCurrentImageContext()
      UIGraphicsEndImageContext()
      return tintedImage
    } else {
      return self
    }
  }

  class func shapeImageWithBezierPath(
    size: CGSize, bezierPath: UIBezierPath,
    fillColor: UIColor?, strokeColor: UIColor?,
    strokeWidth: CGFloat = 0.0
  ) -> UIImage! {
    bezierPath.apply(CGAffineTransform(
      translationX: -bezierPath.bounds.origin.x, y: -bezierPath.bounds.origin.y
    ))
    UIGraphicsBeginImageContext(size)
    let context = UIGraphicsGetCurrentContext()
    var image = UIImage()
    if let context  = context {
      context.saveGState()
      context.addPath(bezierPath.cgPath)
      if strokeColor != nil {
        strokeColor!.setStroke()
        context.setLineWidth(strokeWidth)
      } else { UIColor.clear.setStroke() }
      fillColor?.setFill()
      context.drawPath(using: .fillStroke)
      image = UIGraphicsGetImageFromCurrentImageContext()!
      context.restoreGState()
      UIGraphicsEndImageContext()
    }
    return image
  }

  static func pinImg(color: UIColor) -> UIImage? {
    let size = CGSize(width: 128, height: 256)
    let path = UIBezierPath()

    // Pin Path Trace
    path.move(to: CGPoint(x: 0, y: 64) )
    path.addLine(to: CGPoint(x: 64, y: 256))
    path.addLine(to: CGPoint(x: 128, y: 64))
    path.addArc(withCenter: CGPoint(x: 64, y: 64), radius: 64, startAngle: 0, endAngle: .pi, clockwise: false)

    return UIImage.shapeImageWithBezierPath(size: size, bezierPath: path, fillColor: color, strokeColor: .white)
  }
}
