import UIKit

/**
 - author: Cody Weaver
 - version: 1.0
 
 **Spec:**
 
 Will always be blue - add color property to make it whatever color needed as use
 Will always be 48x48 with 18x18 inner circle
 
 **Uses:**
 
 For any slider the thumb that the user will interact with
 */
final class Thumb : UIView {
   
   // MARK: Properties
   
   /// All the layers that the view can show
   private lazy var outer: CAShapeLayer = self.createLayer(.outer)
   private lazy var inner: CAShapeLayer = self.createLayer(.inner)
   private lazy var edge: CAShapeLayer = self.createLayer(.edge)
   
   /** 
    Determines weather the outer layer is rendered
    
    Set to true when user is interacting with view
    
    *Set this property to render the outer layer or not*
   */
   var active: Bool {
      willSet(newValue) {
         newValue ? self.add(outer) : self.remove(outer)
      }
   }
   
   /**
    Determines weather the inner layer is rendered or the edge is rendered
    
    Set to true when the user reaches the absolute minimum for the slider
    
    *Set this proeprty to render the edge and inner or not*
   */
   var empty: Bool {
      willSet(newValue) {
         if newValue {
            self.add(self.edge)
            self.remove(inner)
         } else {
            self.remove(self.edge)
            self.add(inner)
         }
      }
   }
   
   // MARK: Initializers
   /**
      Default and only initilizier
      
      Renders the standard thumb with a size of 18x18
      The entire size of the view will be 48x48
    
      - parameter origin: The location where the view will be located within its superview
      - parameter active: Set to false by default can be set to true if you want to render the view as active at initilization
      - note: Set's *empty* to false and adds the *inner* circle
   */
   init(origin: CGPoint, active: Bool = false) {
      self.empty = false
      self.active = active
      super.init(frame: CGRect(origin: origin, size: CGSize(width: 48, height: 48)))
      self.add(inner)
   }
   
   /// Required by Apple NEVER USE
   required init?(coder aDecoder: NSCoder) {
      fatalError("This class does not support NSCoding")
   }
   
   // MARK: Functions
   
   /**
    Creates the layer
    
    - parameter properties: The settings for the layer
    - returns: CAShapeLayer that will be used as a sublayer
   */
   private func createLayer(properties: ThumbProperties) -> CAShapeLayer {
      // Create the layer and set it's path
      let layer: CAShapeLayer = CAShapeLayer()
      layer.path = properties.path
      
      // Set the stroke and fill color
      layer.fillColor = properties.fillColor
      layer.strokeColor = properties.strokeColor
      
      // Set the opacity and line width
      layer.opacity = properties.opacity
      layer.lineWidth = properties.lineWidth
      
      // Return the layer
      return layer
      
   }
   
   /**
    Hides the layer by removing it from view
    
    Called from one of the property setters
   */
   private func remove(layer: CAShapeLayer) {
      layer.removeFromSuperlayer()
   }
   
   /**
    Adds the layer by adding it as a sublayer
    
    Called from one of the property setters
    */
   private func add(layer: CAShapeLayer) {
      self.layer.addSublayer(layer)
   }
   
}

/**
 The properties for the thumb that will be used to create them
 */
struct ThumbProperties {
   
   let strokeColor: CGColor
   let lineWidth: CGFloat
   let opacity: Float
   let path: CGPath
   let fillColor: CGColor
   
   /// Use this to create the inner circle for a thumb
   static var inner: ThumbProperties {
      let path: CGPath = UIBezierPath(roundedRect: CGRect(x: 15, y: 15, width: 18, height: 18), cornerRadius: 6).CGPath
      return ThumbProperties(strokeColor: UIColor.clearColor().CGColor, lineWidth: 0.0, opacity: 1.0, path: path, fillColor: UIColor.blue.CGColor)
   }
   
   /// Use this to create and outer circle for a thumb
   static var outer: ThumbProperties {
      let path: CGPath = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 48, height: 48), cornerRadius: 24).CGPath
      return ThumbProperties(strokeColor: UIColor.clearColor().CGColor, lineWidth: 0.0, opacity: 0.38, path: path, fillColor: UIColor.blue.CGColor)
   }
   
   /// Use this to create the edge for a thumb
   static var edge: ThumbProperties {
      let path: CGPath = UIBezierPath(roundedRect: CGRect(x: 16.5, y: 16.5, width: 15, height: 15), cornerRadius: 9).CGPath
      return ThumbProperties(strokeColor: UIColor.blue.CGColor, lineWidth: 3.0, opacity: 1.0, path: path, fillColor: UIColor.clearColor().CGColor)
   }
   
}






