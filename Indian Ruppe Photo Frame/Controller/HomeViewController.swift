//
//  HomeViewController.swift
//  Indian Ruppe Photo Frame
//
//  Created by Alpesh on 01/12/16.
//  Copyright © 2016 Cousins Infotech. All rights reserved.
//

import UIKit
import GoogleMobileAds

class HomeViewController: UIViewController, UIActionSheetDelegate,UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    @IBOutlet weak var mainScrollerView: UIScrollView?
    @IBOutlet weak var navigationView: UIView?
    @IBOutlet weak var mainContainerView: UIView?
    @IBOutlet weak var lblnavigationTitle: UILabel?
    @IBOutlet weak var lblRuppeSelect: UILabel?

    @IBOutlet weak var btn10Rupee: UIButton?
    @IBOutlet weak var btn50Rupee: UIButton?
    @IBOutlet weak var btn100Rupee: UIButton?
    @IBOutlet weak var btn500Rupee: UIButton?
    @IBOutlet weak var btn1000Rupee: UIButton?
    @IBOutlet weak var btn2000Rupee: UIButton?

    @IBOutlet weak var bannerView: GADBannerView!
    
    
     var myActionSheet: UIActionSheet?
    var image1: UIImageView?
   var picker:UIImagePickerController? = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupInitialView();
        UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
        
        }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        appdelegate.shouldSupportAllOrientation = false
        
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
      
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
    func setupInitialView()
    {
        
        print("Google Mobile Ads SDK version: \(GADRequest.sdkVersion())")
        bannerView.adUnitID = "ca-app-pub-5892669331806530~7722057809"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        
        self.automaticallyAdjustsScrollViewInsets = false
              self.mainContainerView?.backgroundColor = UIColor.white;
    
        let bounds = UIScreen.main.bounds
        let height = bounds.size.height
        
        switch height {
        case 480.0:
            print("iPhone 3,4")
              lblnavigationTitle?.font = UIFont.systemFont(ofSize: 18)
             lblRuppeSelect?.font = UIFont.systemFont(ofSize: 18)
        case 568.0:
            
//        self.btnStart?.titleLabel?.font = UIFont.systemFont(ofSize: 20)
            print("iPhone 5")
              lblnavigationTitle?.font = UIFont.systemFont(ofSize: 18)
             lblRuppeSelect?.font = UIFont.systemFont(ofSize: 18)
        case 667.0:
            print("iPhone 6")
              lblnavigationTitle?.font = UIFont.systemFont(ofSize: 24)
             lblRuppeSelect?.font = UIFont.systemFont(ofSize: 24)
        case 736.0:
            print("iPhone 6+")
              lblnavigationTitle?.font = UIFont.systemFont(ofSize: 28)
             lblRuppeSelect?.font = UIFont.systemFont(ofSize: 28)
            
        default:
            print("not an iPhone")
            lblnavigationTitle?.font = UIFont.systemFont(ofSize: 32)
            lblRuppeSelect?.font = UIFont.systemFont(ofSize: 32)
        }
        
       myActionSheet =  UIActionSheet()
        let title: String = "Action Sheet!"
        myActionSheet?.title  = title

        myActionSheet?.delegate = self
   
         self.btn10Rupee?.addTarget(self, action: #selector(StartClicked), for: .touchUpInside)
         self.btn50Rupee?.addTarget(self, action: #selector(StartClicked1), for: .touchUpInside)
         self.btn100Rupee?.addTarget(self, action: #selector(StartClicked2), for: .touchUpInside)
         self.btn500Rupee?.addTarget(self, action: #selector(StartClicked3), for: .touchUpInside)
         self.btn1000Rupee?.addTarget(self, action: #selector(StartClicked4), for: .touchUpInside)
         self.btn2000Rupee?.addTarget(self, action: #selector(StartClicked5), for: .touchUpInside)
    }
    
    @IBAction func StartClicked(sender: UIButton){
       
        UserDefaults.standard.set("1", forKey: "Type")
        UserDefaults.standard.synchronize()
        self .showActionSheet(sender: myActionSheet!)
        
    }
    
    @IBAction func StartClicked1(sender: UIButton){
        UserDefaults.standard.set("2", forKey: "Type")
        UserDefaults.standard.synchronize()
        self .showActionSheet(sender: myActionSheet!)
        
    }
    @IBAction func StartClicked2(sender: UIButton){
        UserDefaults.standard.set("3", forKey: "Type")
        UserDefaults.standard.synchronize()
        self .showActionSheet(sender: myActionSheet!)
        
    }
    @IBAction func StartClicked3(sender: UIButton){
        UserDefaults.standard.set("4", forKey: "Type")
        UserDefaults.standard.synchronize()
        self .showActionSheet(sender: myActionSheet!)
        
    }
    @IBAction func StartClicked4(sender: UIButton){
        UserDefaults.standard.set("5", forKey: "Type")
        UserDefaults.standard.synchronize()
        self .showActionSheet(sender: myActionSheet!)
        
    }
    @IBAction func StartClicked5(sender: UIButton){
        UserDefaults.standard.set("6", forKey: "Type")
        UserDefaults.standard.synchronize()
        self .showActionSheet(sender: myActionSheet!)
        
    }
    @IBAction func showActionSheet(sender: AnyObject) {
        
        let optionMenu = UIAlertController(title: nil, message: "Choose Option", preferredStyle: .actionSheet)
        
        let deleteAction = UIAlertAction(title: "Camera", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.actionLaunchCamera()
                        print("File Deleted")
        })
        let saveAction = UIAlertAction(title: "Gallery Photos", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.openGallary()
            print("File Saved")
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {
            (alert: UIAlertAction!) -> Void in
            print("Cancelled")
        })
        
        optionMenu.addAction(deleteAction)
        optionMenu.addAction(saveAction)
        optionMenu.addAction(cancelAction)
        
        optionMenu.popoverPresentationController?.sourceView = self.view
//        optionMenu.popoverPresentationController?.sourceRect = CGRect.init(self.view.bounds.size.width / 2.0, self.view.bounds.size.height / 2.0, 1.0, 1.0)
        optionMenu.popoverPresentationController?.sourceRect = CGRect.init(x: self.view.bounds.size.width / 2.0, y: self.view.bounds.size.height / 2.0, width: 1.0, height: 1.0)
        
        self.present(optionMenu, animated: true, completion: nil)
    }
    
    func actionLaunchCamera()
    {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera)
        {
            picker = UIImagePickerController()
            picker?.delegate = self
            picker?.sourceType = UIImagePickerControllerSourceType.camera
            picker?.allowsEditing = true
            
            self.present((picker)!, animated: true, completion: nil)
        }
        else
        {
            let alert:UIAlertController = UIAlertController(title: "Camera Unavailable", message: "Unable to find a camera on this device", preferredStyle: UIAlertControllerStyle.alert)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func openGallary(){
        picker = UIImagePickerController()
        picker?.delegate = self
        picker?.sourceType = UIImagePickerControllerSourceType.photoLibrary
        self.present(picker!, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            image1?.contentMode = .scaleToFill
            image1?.image = pickedImage
            
            
            let vc = RupeeViewController(nibName: "RupeeViewController", bundle: nil)
        
            vc.imageSelected = pickedImage;
            self.navigationController!.pushViewController(vc, animated: true)
            
        }
        
        picker.dismiss(animated: true, completion: nil)
    }

    func image(image: UIImage, didFinishSavingWithError error: NSErrorPointer, contextInfo:UnsafeRawPointer) {
        
        if error != nil {
            let alert = UIAlertController(title: "Save Failed",
                                          message: "Failed to save image",
                                          preferredStyle: UIAlertControllerStyle.alert)
            
            let cancelAction = UIAlertAction(title: "OK",
                                             style: .cancel, handler: nil)
            
            alert.addAction(cancelAction)
            self.present(alert, animated: true,
                         completion: nil)
        }
    }
    
}
