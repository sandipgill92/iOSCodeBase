//
//  LiveRendering.swift
//  Organisaur
//
//  Created by Sandip Gill on 19/04/22.
//

import Foundation
import UIKit

extension UIView {
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var roundedCorner: Bool {
        get {
            return false
        }
        set {
            layer.cornerRadius = newValue ? self.frame.height / 2 : 0
        }
    }
    
    @IBInspectable var shadowColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.shadowColor = uiColor.cgColor
        }
        get {
            guard let color = layer.shadowColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
    
    @IBInspectable var shadowOpacity: Float {
        set {
            layer.shadowOpacity = newValue
        }
        get {
            return layer.shadowOpacity
        }
    }
    
    @IBInspectable var shadowOffset: CGSize {
        set {
            layer.shadowOffset = newValue
        }
        get {
            return layer.shadowOffset
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat {
        set {
            layer.shadowRadius = newValue
        }
        get {
            return layer.shadowRadius
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
            layer.masksToBounds = true
        }
        get {
            return layer.borderWidth
        }
    }
    
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        DispatchQueue.main.async {
            self.layer.masksToBounds = false
            self.layer.shadowColor = color.cgColor
            self.layer.shadowOpacity = opacity
            self.layer.shadowOffset = offSet
            self.layer.shadowRadius = radius
            self.layer.cornerRadius = radius
            self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
            self.layer.shouldRasterize = true
            self.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
        }
      }
    
    func fadeTransition(_ duration:CFTimeInterval) {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name:
                                                            CAMediaTimingFunctionName.easeInEaseOut)
        animation.type = CATransitionType.fade
        animation.duration = duration
        layer.add(animation, forKey: CATransitionType.fade.rawValue)
    }

    func roundCorners(radius: CGFloat, corners: CACornerMask) {
        DispatchQueue.main.async {
            self.layer.cornerRadius = radius
            self.layer.maskedCorners = corners
            self.layer.masksToBounds = true
        }
    }
    
    func setGradient(color1: UIColor, color2: UIColor) {
        DispatchQueue.main.async {
            let colorTop =  color1.cgColor
            let colorBottom = color2.cgColor
            if let gradientLayer = self.layer.sublayers?.first as? CAGradientLayer {
                gradientLayer.colors = [colorTop, colorBottom]
                gradientLayer.frame = self.bounds
                gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
                gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
            } else {
                let gradientLayer = CAGradientLayer()
                gradientLayer.colors = [colorTop, colorBottom]
                gradientLayer.frame = self.bounds
                gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
                gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
                self.layer.insertSublayer(gradientLayer, at: 0)
            }
        }
    }
    
    func removeSublayer() {
        guard let sublayers = self.layer.sublayers else {
            print("The view does not have any sublayers.")
            return
        }
        if sublayers.count > 0 {
            self.layer.sublayers?.remove(at: 0)
        } else {
            print("There are not enough sublayers to remove that index.")
        }
    }
    
    func setGradientVertical(color1: UIColor, color2: UIColor) {
        DispatchQueue.main.async {
            
            let colorTop =  color1.cgColor
            let colorBottom = color2.cgColor
            if let gradientLayer = self.layer.sublayers?.first as? CAGradientLayer {
                gradientLayer.colors = [colorTop, colorBottom]
                gradientLayer.frame = self.bounds
                gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
                gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
            } else {
                let gradientLayer = CAGradientLayer()
                gradientLayer.colors = [colorTop, colorBottom]
                gradientLayer.frame = self.bounds
                gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
                gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
                self.layer.insertSublayer(gradientLayer, at: 0)
            }
        }
    }
    
    func addBottomBorder(color: UIColor) {
        DispatchQueue.main.async {
            let bottomLine = CALayer()
            bottomLine.frame = CGRect(x: 0.0, y: self.frame.height - 1, width: self.frame.width, height: 1.0)
            bottomLine.backgroundColor = color.cgColor
            self.layer.addSublayer(bottomLine)
        }
    }
    
    func addTopBorder(color: UIColor) {
        DispatchQueue.main.async {
            let bottomLine = CALayer()
            bottomLine.frame = CGRect(x: 0.0, y: 0.0, width: self.frame.width, height: 1.0)
            bottomLine.backgroundColor = color.cgColor
            self.layer.addSublayer(bottomLine)
        }
    }
}

extension UIApplication {
    
    var mainKeyWindow: UIWindow? {
        get { if #available(iOS 13, *) {
                return connectedScenes
                    .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
                    .first { $0.isKeyWindow }
            } else {
                return keyWindow
            }
        }
    }
}

extension UITapGestureRecognizer {

    func didTapAttributedTextInLabel(label: UILabel, inRange targetRange: NSRange) -> Bool {
            // Create instances of NSLayoutManager, NSTextContainer and NSTextStorage
        let layoutManager = NSLayoutManager()
        let textContainer = NSTextContainer(size: CGSize.zero)
        let textStorage = NSTextStorage(attributedString: label.attributedText!)

            // Configure layoutManager and textStorage
        layoutManager.addTextContainer(textContainer)
        textStorage.addLayoutManager(layoutManager)

            // Configure textContainer
        textContainer.lineFragmentPadding = 0.0
        textContainer.lineBreakMode = label.lineBreakMode
        textContainer.maximumNumberOfLines = label.numberOfLines
        let labelSize = label.bounds.size
        textContainer.size = labelSize

            // Find the tapped character location and compare it to the specified range
        let locationOfTouchInLabel = self.location(in: label)
        let textBoundingBox = layoutManager.usedRect(for: textContainer)
        let textContainerOffset = CGPoint(
            x: (labelSize.width - textBoundingBox.size.width) * 0.5 - textBoundingBox.origin.x,
            y: (labelSize.height - textBoundingBox.size.height) * 0.5 - textBoundingBox.origin.y
        )
        let locationOfTouchInTextContainer = CGPoint(
            x: locationOfTouchInLabel.x - textContainerOffset.x,
            y: locationOfTouchInLabel.y - textContainerOffset.y
        )
        let indexOfCharacter = layoutManager.characterIndex(for: locationOfTouchInTextContainer,
                                                            in: textContainer,
                                                            fractionOfDistanceBetweenInsertionPoints: nil)

        return NSLocationInRange(indexOfCharacter, targetRange)
    }
}
