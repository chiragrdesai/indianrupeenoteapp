//
//  RupeeViewController.swift
//  Indian Ruppe Photo Frame
//
//  Created by Alpesh on 01/12/16.
//  Copyright © 2016 Cousins Infotech. All rights reserved.
//

import UIKit
import AssetsLibrary

class RupeeViewController: UIViewController, UIScrollViewDelegate , UIGestureRecognizerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    @IBOutlet weak var mainScrollerView: UIScrollView?
    @IBOutlet weak var navigationBarView: UIView?
     @IBOutlet weak var lblTitle: UILabel?
     @IBOutlet weak var btnBack: UIButton?
    
    @IBOutlet weak var mainContainerView: UIView?
    @IBOutlet weak var imageSelectedView: UIImageView?
     @IBOutlet weak var imageFullView: UIImageView?
    
     @IBOutlet weak var btnSave: UIButton?
     @IBOutlet weak var btnShare: UIButton?
     @IBOutlet weak var btnDelete: UIButton?
    
       var imageSelected: UIImage?
    var pinchGesture = UIPinchGestureRecognizer()
    var RotateGesture = UIRotationGestureRecognizer()
     var imagemain: UIImage?
     var strtype: NSString?
    
    var imageScreenShot: UIImage?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.automaticallyAdjustsScrollViewInsets = false
        self.mainContainerView?.backgroundColor = UIColor.white;
        
        let bounds = UIScreen.main.bounds
        let height = bounds.size.height
        
        switch height {
        case 480.0:
            print("iPhone 3,4")
            lblTitle?.font = UIFont.systemFont(ofSize: 18)
            self.btnBack?.titleLabel?.font? = UIFont.systemFont(ofSize: 18)
        case 568.0:
            
            //        self.btnStart?.titleLabel?.font = UIFont.systemFont(ofSize: 20)
            print("iPhone 5")
            lblTitle?.font = UIFont.systemFont(ofSize: 18)
           self.btnBack?.titleLabel?.font? = UIFont.systemFont(ofSize: 18)
        case 667.0:
            print("iPhone 6")
            lblTitle?.font = UIFont.systemFont(ofSize: 22)
            self.btnBack?.titleLabel?.font? = UIFont.systemFont(ofSize: 22)
        case 736.0:
            print("iPhone 6+")
            lblTitle?.font = UIFont.systemFont(ofSize: 26)
           self.btnBack?.titleLabel?.font? = UIFont.systemFont(ofSize: 26)
            
        default:
            print("not an iPhone")
            lblTitle?.font = UIFont.systemFont(ofSize: 30)
           self.btnBack?.titleLabel?.font? = UIFont.systemFont(ofSize: 30)
        }

        
        strtype = UserDefaults.standard.value(forKey: "Type") as! NSString?
        print(strtype!)
        
        if strtype == "1"
        {
             imageFullView?.image = UIImage(named: "10Rupee")
             imageFullView?.clipsToBounds = true
            
            imageSelectedView?.frame = CGRect(x: 303, y: 18, width: 220, height: 274)
        }
        
        if strtype == "2"
        {
            imageFullView?.image = UIImage(named: "50rupee")
             imageFullView?.clipsToBounds = true
            imageSelectedView?.frame = CGRect(x: 267, y: 18, width: 227, height: 274)
        }
        
        if strtype == "3"
        {
            imageFullView?.image = UIImage(named: "100-Rupee")
             imageFullView?.clipsToBounds = true
            imageSelectedView?.frame = CGRect(x: 267, y: 18, width: 227, height: 274)
        }
        if strtype == "4"
        {
            imageFullView?.image = UIImage(named: "500-Rupee")
             imageFullView?.clipsToBounds = true
            imageSelectedView?.frame = CGRect(x: 117, y: 18, width: 210, height: 274)
        }
        
        if strtype == "5"
        {
            imageFullView?.image = UIImage(named: "New-Rs-1000")
             imageFullView?.clipsToBounds = true
            imageSelectedView?.frame =  CGRect(x: 267, y: 18, width: 227, height: 274)
        }
        
        if strtype == "6"
        {
            imageFullView?.image = UIImage(named: "2000-front-side")
             imageFullView?.clipsToBounds = true
            imageSelectedView?.frame = CGRect(x: 117, y: 18, width: 210, height: 274)
        }
        
        self.imageSelectedView?.isUserInteractionEnabled = true
        self.imageSelectedView?.isMultipleTouchEnabled = true
        
       self.pinchGesture.delegate = self
        self.pinchGesture = UIPinchGestureRecognizer(target:self, action: #selector(pinchRecognized))
         self.RotateGesture.delegate = self
         self.RotateGesture = UIRotationGestureRecognizer(target:self, action: #selector(handleRotate))
       
          self.imageSelectedView?.addGestureRecognizer(self.RotateGesture)
        
         self.btnSave?.addTarget(self, action: #selector(btnSaveClicked), for: .touchUpInside)
        
         self.btnDelete?.addTarget(self, action: #selector(btnDeleteClicked), for: .touchUpInside)
        
        self.btnBack?.addTarget(self, action: #selector(btnbackClicked), for: .touchUpInside)
        
          self.btnShare?.addTarget(self, action: #selector(btnShareClicked), for: .touchUpInside)
        
          self.imageSelectedView?.addGestureRecognizer(self.pinchGesture)
        self.imageSelectedView?.image = imageSelected;
        
        let panGesture = UIPanGestureRecognizer(target: self, action:(#selector(RupeeViewController.handlePan(_:))))
        self.imageSelectedView?.addGestureRecognizer(panGesture)
        
        imageSelectedView!.layer.borderColor = UIColor.gray.cgColor
//        imageSelectedView!.layer.cornerRadius = imageSelectedView!.frame.height/2
        imageSelectedView!.layer.masksToBounds = false
        imageSelectedView!.clipsToBounds = true
        imageSelectedView!.layer.borderWidth = 0.5
        imageSelectedView!.contentMode = UIViewContentMode.scaleAspectFill
        
//        btnBack.navi.popViewControllerAnimated(true)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        appdelegate.shouldSupportAllOrientation = true
        
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")

        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
    }

    private func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.landscapeLeft
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
           }
  
    func pinchRecognized(pinch: UIPinchGestureRecognizer) {
        self.imageSelectedView?.addGestureRecognizer(pinchGesture)
        self.imageSelectedView?.transform = (self.imageSelectedView?.transform)!.scaledBy(x: pinch.scale, y: pinch.scale)
        pinch.scale = 1.0
    }

    @IBAction func handleRotate(recognizer : UIRotationGestureRecognizer) {
         self.imageSelectedView?.addGestureRecognizer(RotateGesture)
            self.imageSelectedView?.transform = (imageSelectedView?.transform.rotated(by: recognizer.rotation))!
            recognizer.rotation = 0
        
    }
    
     @IBAction func btnSaveClicked(sender: AnyObject) {
        
        self .screenShotMethod();
        
    }
    func screenShotMethod() {
        //Create the UIImage
        UIGraphicsBeginImageContextWithOptions((mainContainerView?.bounds.size)!, false,UIScreen.main.scale)
        mainContainerView?.layer.render(in: UIGraphicsGetCurrentContext()!)
        imageScreenShot = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        //Save it to the camera roll
        UIImageWriteToSavedPhotosAlbum(imageScreenShot!, nil, nil, nil)
        
        let alert = UIAlertController(title: "Photo", message: "Successfully Saved Photos in MyCamera Roll", preferredStyle: UIAlertControllerStyle.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func btnDeleteClicked(sender: AnyObject) {
        
        self.imageSelectedView?.image = nil;
        
    }
    
    @IBAction func handlePan(_ gestureRecognizer: UIPanGestureRecognizer) {
        if gestureRecognizer.state == .began || gestureRecognizer.state == .changed {
            
            let translation = gestureRecognizer.translation(in: self.view)
            // note: 'view' is optional and need to be unwrapped
            gestureRecognizer.view!.center = CGPoint(x: gestureRecognizer.view!.center.x + translation.x, y: gestureRecognizer.view!.center.y + translation.y)
            gestureRecognizer.setTranslation(CGPoint.zero, in: self.view)
        }
    }
    
    @IBAction func btnbackClicked(sender: AnyObject) {
        
         _ = navigationController?.popViewController(animated: true)
        
    }
    
    
    @IBAction func btnShareClicked(sender: AnyObject) {
        
        UIGraphicsBeginImageContextWithOptions((mainContainerView?.bounds.size)!, false,UIScreen.main.scale)
        mainContainerView?.layer.render(in: UIGraphicsGetCurrentContext()!)
        imageScreenShot = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        appdelegate.shouldSupportAllOrientation = false
        
        let vc = ShareViewController(nibName: "ShareViewController", bundle: nil)
        vc.imageShare = imageScreenShot
        self.navigationController!.pushViewController(vc, animated: true)
        
    }
    
   


    

}
