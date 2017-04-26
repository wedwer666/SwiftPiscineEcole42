//
//  ViewController.swift
//  Day06
//
//  Created by Mitriuc Maria on 4/25/17.
//  Copyright © 2017 Maria Mitriuc. All rights reserved.
//


import UIKit
import CoreMotion

class ViewController: UIViewController, UIScrollViewDelegate {
    
    var panPetru : SubView? = nil
    var width : CGFloat?
    var height : CGFloat?
    
    @IBOutlet var panMaria: UIPinchGestureRecognizer!

    @IBAction func rotateFigure(_ sender: UIRotationGestureRecognizer) {
        switch sender.state {
        case .began :
            print("began")
            var ha = 0
            for v in array {
                let o = v.frame
                let point = sender.location(in: view)
                if o.contains(point) {
                    print(ha)
                    panPetru = array[ha]
                    gravity.removeItem(array[ha])
                    boundaries.removeItem(array[ha])
                    bounce.removeItem(array[ha])
                    array.remove(at: ha)
                    
                    break
                }
                ha += 1
            }
            break
        case .changed :
            print("changed")
            if panPetru != nil
            {
                print(panPetru?.frame.size ?? "nil")
                print(sender.rotation)
                panPetru?.transform = CGAffineTransform(rotationAngle: sender.rotation)
                
            }
            break
        case .ended :
            print("Ended")
            if panPetru != nil {
                print(panPetru?.frame.size ?? "nil")
                print(panPetru?.frame.size.width ?? "nil")
                print(panPetru?.frame.size.height ?? "nil")
                
                print("\(array.count)")
                let newView = SubView(frame1: (panPetru?.frame)!)
                newView.backgroundColor = panPetru?.backgroundColor
                newView.layer.cornerRadius = panPetru?.type! == "Circle" ? newView.frame.width / 2 : 0
                newView.transform = (panPetru?.transform)!
                newView.type = panPetru?.type
                panPetru?.removeFromSuperview()
                self.view.addSubview(newView)
                array.append(newView)
                gravity.addItem(newView)
                boundaries.addItem(newView)
                bounce.addItem(newView)
                panPetru = nil
            }
            break
        default:
            break
        }
    }
    
    @IBAction func coursant(_ sender: UIPinchGestureRecognizer)
    {
        print("pinch gesture")
        array.forEach { (i) in
            print(i.frame.size)
        }
        switch sender.state {
        case .began:
            print("began")
            var ha = 0
             for v in array {
                let o = v.frame
                let point = sender.location(in: view)
                if o.contains(point) {
                    print(ha)
                    panPetru = array[ha]
                    gravity.removeItem(array[ha])
                    boundaries.removeItem(array[ha])
                    bounce.removeItem(array[ha])
                    array.remove(at: ha)
                    
                    break
                }
                ha += 1
            }
            break
        case .changed:
            print("changed")
            if panPetru != nil
            {
                print(panPetru?.frame.size ?? "nil")
                print(sender.scale)
                panPetru?.transform = CGAffineTransform(scaleX: sender.scale, y: sender.scale)
                
            }
            break
        case .ended:
            print("Ended")
            if panPetru != nil {
                print(panPetru?.frame.size ?? "nil")
                print(panPetru?.frame.size.width ?? "nil")
                print(panPetru?.frame.size.height ?? "nil")
                
                print("\(array.count)")
                let newView = SubView(frame1: (panPetru?.frame)!)
                newView.backgroundColor = panPetru?.backgroundColor
                newView.layer.cornerRadius = panPetru?.type! == "Circle" ? newView.frame.width / 2 : 0
                newView.type = panPetru?.type
                panPetru?.removeFromSuperview()
                self.view.addSubview(newView)
                array.append(newView)
                gravity.addItem(newView)
                boundaries.addItem(newView)
                bounce.addItem(newView)
                panPetru = nil
            }
            break
        default:
            break
        }
    }
   
    @IBAction func panRecog(_ sender: UIPanGestureRecognizer)
    {
        print("pan gesture")
        array.forEach { (i) in
            print(i.frame.size)
        }
        var ha: Int = 0
        switch sender.state {
        case .began:
            print("began")
            for v in array {
                let o = v.frame
                let point = sender.location(in: view)
                if o.contains(point) {
                    print(ha)
                    print(array[ha].frame.size)
                    panPetru = array[ha]
                    
                    gravity.removeItem(array[ha])
                    boundaries.removeItem(array[ha])
                    bounce.removeItem(array[ha])
                    array.remove(at: ha)
                    self.width = panPetru?.frame.width
                    self.height = panPetru?.frame.height
                
                    break
                }
                ha += 1
            }
            break
        case .changed:
            print("changed")
            if panPetru != nil {
                print(panPetru?.frame.size)
                print("heig")
                let x = sender.location(in: view).x - self.width! / 2
                let y = sender.location(in: view).y - self.height! / 2
                let frame = CGRect(x: x, y: y, width: self.width!, height: self.height!)
                panPetru?.frame = frame
            }
            break
        case .ended:
            print("Ended")
            if panPetru != nil {
                ha = 0
                array.append(panPetru!)
                gravity.addItem(panPetru!)
                boundaries.addItem(panPetru!)
                bounce.addItem(panPetru!)
                panPetru = nil
                
//                print(panPetru?.frame.size ?? "nil")
//                print(panPetru?.frame.size.width ?? "nil")
//                print(panPetru?.frame.size.height ?? "nil")
//                
//                print("\(array.count)")
//                let newView = SubView(frame1: (panPetru?.frame)!)
//                newView.backgroundColor = panPetru?.backgroundColor
//                newView.layer.cornerRadius = panPetru?.type! == "Circle" ? newView.frame.width / 2 : 0
//                newView.type = panPetru?.type
//                panPetru?.removeFromSuperview()
//                self.view.addSubview(newView)
//                array.append(newView)
//                gravity.addItem(newView)
//                boundaries.addItem(newView)
//                bounce.addItem(newView)
//                panPetru = nil
            }
            break
        default:
            break
        }
    }

    var array = [SubView]()
    var animator: UIDynamicAnimator?
    var gravity = UIGravityBehavior()
    var boundaries = UICollisionBehavior()
    var bounce = UIDynamicItemBehavior()


   let motionManager =  CMMotionManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.yellow
       // self.scrollView.minimumZoomScale = 1.0
        //self.scrollView.maximumZoomScale = 6.0
        
      animator = UIDynamicAnimator(referenceView: self.view)
        let direction = CGVector(dx: 0.0, dy: 0.1)
        gravity.gravityDirection = direction
        boundaries.translatesReferenceBoundsIntoBoundary = true
        bounce.elasticity = 1
        

        animator?.addBehavior(bounce)
        animator?.addBehavior(boundaries)
        animator?.addBehavior(gravity)
        
    }

    
//    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
//        return
//    }

    
    @IBAction func tapAction(_ sender: UITapGestureRecognizer)
    {
        print("1")
        let x = sender.location(in: view).x - 50
        let y = sender.location(in: view).y - 50
        let frame = CGRect(x: x, y: y, width: 100, height: 100)
        let newView = SubView(frame: frame)
        array.append(newView)
        self.view.addSubview(newView)
        print("2")
        gravity.addItem(newView)
        print("3")
        boundaries.addItem(newView)
        print("4")
        bounce.addItem(newView)
        print("5")
        print("6")
    }

    

    
    func accelerometerHandler(data :CMAccelerometerData? ,error:NSError?)
    {
        print("accelometerhandler canceled")
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }


}

class SubView : UIView
{
    private let colors = [
        UIColor.black,
        UIColor.blue,
        UIColor.yellow,
        UIColor.red,
        UIColor.magenta,
        UIColor.purple,
        UIColor.green,
        UIColor.cyan,
        UIColor.brown
    ]
    var type : String?
    
    func moveFigure(_ sender: UIPanGestureRecognizer)
    {
        let x = sender.location(in: self.superview).x - 50
        let y = sender.location(in: self.superview).y - 50
        
        let newFrame = CGRect(x: x, y: y, width: 100, height: 100)
        superview?.frame = newFrame
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let type = arc4random_uniform(2) == 1
        self.type = type ? "Circle" : "Square"
        self.layer.cornerRadius = type ? 50 : 0
        self.backgroundColor = colors[Int(arc4random_uniform(UInt32(colors.count)))]
        
    }
    init(frame1: CGRect) {
        super.init(frame: frame1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
