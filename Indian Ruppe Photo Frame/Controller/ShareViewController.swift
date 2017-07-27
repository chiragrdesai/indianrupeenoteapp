//
//  ShareViewController.swift
//  Indian Ruppe Photo Frame
//
//  Created by Alpesh on 06/12/16.
//  Copyright © 2016 Cousins Infotech. All rights reserved.
//

import UIKit
import Social
import Photos
import MessageUI
import GoogleMobileAds

class ShareViewController: UIViewController, UIScrollViewDelegate, UIDocumentInteractionControllerDelegate, MFMailComposeViewControllerDelegate{
    
    @IBOutlet weak var mainScrollerView: UIScrollView?
    @IBOutlet weak var navigationBarView: UIView?
    @IBOutlet weak var lblTitle: UILabel?
    @IBOutlet weak var btnBack: UIButton?
    
    @IBOutlet weak var mainContainerView: UIView?
    @IBOutlet weak var imageCompanyLogo: UIImageView?
     @IBOutlet weak var btnCompanysite: UIButton?
    
     @IBOutlet weak var btnFacebook: UIButton?
     @IBOutlet weak var lblFacebook: UILabel?
    
    @IBOutlet weak var btnWhatsapp: UIButton?
    @IBOutlet weak var lblwhatsapp: UILabel?
    
    @IBOutlet weak var btnInstagram: UIButton?
    @IBOutlet weak var lblInstagram: UILabel?
    
    @IBOutlet weak var btnEmail: UIButton?
    @IBOutlet weak var lblEmail: UILabel?
     @IBOutlet weak var image: UIImageView?
    var imageShare: UIImage?
    
     @IBOutlet weak var bannerView: GADBannerView!
    
    var documentController: UIDocumentInteractionController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupInitialView()
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")

        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        
    }
    private func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
    override func viewWillDisappear(_ animated: Bool) {
       
        
    }

    
    func setupInitialView()
    {
        self.automaticallyAdjustsScrollViewInsets = false
        self.mainContainerView?.backgroundColor = UIColor.white;
        
        print("Google Mobile Ads SDK version: \(GADRequest.sdkVersion())")
        bannerView.adUnitID = "ca-app-pub-5892669331806530~7722057809"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())

        
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        
        let bounds = UIScreen.main.bounds
        let height = bounds.size.height
        
        switch height {
        case 480.0:
            print("iPhone 3,4")
        case 568.0:
            lblTitle?.font = UIFont.systemFont(ofSize: 18)
            self.btnBack?.titleLabel?.font? = UIFont.systemFont(ofSize: 18)
             self.btnCompanysite?.titleLabel?.font? = UIFont.systemFont(ofSize: 20)
            lblFacebook?.font = UIFont.systemFont(ofSize: 14)
             lblwhatsapp?.font = UIFont.systemFont(ofSize: 14)
            lblEmail?.font = UIFont.systemFont(ofSize: 14)
             lblInstagram?.font = UIFont.systemFont(ofSize: 14)
            
            print("iPhone 5")
            lblTitle?.font = UIFont.systemFont(ofSize: 18)
            self.btnBack?.titleLabel?.font? = UIFont.systemFont(ofSize: 18)
            self.btnCompanysite?.titleLabel?.font? = UIFont.systemFont(ofSize: 20)
            lblFacebook?.font = UIFont.systemFont(ofSize: 14)
            lblwhatsapp?.font = UIFont.systemFont(ofSize: 14)
            lblEmail?.font = UIFont.systemFont(ofSize: 14)
            lblInstagram?.font = UIFont.systemFont(ofSize: 14)
        case 667.0:
            print("iPhone 6")
            lblTitle?.font = UIFont.systemFont(ofSize: 22)
            self.btnBack?.titleLabel?.font? = UIFont.systemFont(ofSize: 22)
            self.btnCompanysite?.titleLabel?.font? = UIFont.systemFont(ofSize: 24)
            lblFacebook?.font = UIFont.systemFont(ofSize: 18)
            lblwhatsapp?.font = UIFont.systemFont(ofSize: 18)
            lblEmail?.font = UIFont.systemFont(ofSize: 18)
            lblInstagram?.font = UIFont.systemFont(ofSize: 18)
        case 736.0:
            print("iPhone 6+")
            lblTitle?.font = UIFont.systemFont(ofSize: 26)
            self.btnBack?.titleLabel?.font? = UIFont.systemFont(ofSize: 26)
            self.btnCompanysite?.titleLabel?.font? = UIFont.systemFont(ofSize: 28)
            lblFacebook?.font = UIFont.systemFont(ofSize: 22)
            lblwhatsapp?.font = UIFont.systemFont(ofSize: 22)
            lblEmail?.font = UIFont.systemFont(ofSize: 22)
            lblInstagram?.font = UIFont.systemFont(ofSize: 22)
            
        default:
            print("not an iPhone")
            lblTitle?.font = UIFont.systemFont(ofSize: 40)
            self.btnBack?.titleLabel?.font? = UIFont.systemFont(ofSize: 40)
            self.btnCompanysite?.titleLabel?.font? = UIFont.systemFont(ofSize: 40)
            lblFacebook?.font = UIFont.systemFont(ofSize: 30)
            lblwhatsapp?.font = UIFont.systemFont(ofSize: 30)
            lblEmail?.font = UIFont.systemFont(ofSize: 30)
            lblInstagram?.font = UIFont.systemFont(ofSize: 30)
            
        }
        
         self.btnFacebook?.addTarget(self, action: #selector(btnFacebookClicked), for: .touchUpInside)
         self.btnWhatsapp?.addTarget(self, action: #selector(btnWhatsappClicked), for: .touchUpInside)
         self.btnInstagram?.addTarget(self, action: #selector(btnInstaGramClicked), for: .touchUpInside)
         self.btnEmail?.addTarget(self, action: #selector(btnEmailClicked), for: .touchUpInside)
        self.btnBack?.addTarget(self, action: #selector(btnbackClicked), for: .touchUpInside)
         self.btnCompanysite?.addTarget(self, action: #selector(btnCompanyURLClicked), for: .touchUpInside)

    }
    
    @IBAction func btnFacebookClicked(sender: AnyObject) {
        
        if let vc = SLComposeViewController(forServiceType: SLServiceTypeFacebook) {
          vc.add(imageShare)
                      present(vc, animated: true)
        }
    }
    
    @IBAction func btnWhatsappClicked(sender: AnyObject) {
        
        let urlWhats = "whatsapp://app"
        if let urlString = urlWhats.addingPercentEncoding(withAllowedCharacters:CharacterSet.urlQueryAllowed) {
            if let whatsappURL = URL(string: urlString) {
                
                if UIApplication.shared.canOpenURL(whatsappURL as URL) {
                    
                    if let image = imageShare {
                        if let imageData = UIImageJPEGRepresentation(image, 1.0) {
                            let tempFile = URL(fileURLWithPath: NSHomeDirectory()).appendingPathComponent("Documents/whatsAppTmp.wai")
                            do {
                                try imageData.write(to: tempFile, options: .atomic)
                                documentController = UIDocumentInteractionController(url: tempFile)
                                documentController.uti = "net.whatsapp.image"
                                documentController.presentOpenInMenu(from: CGRect.zero, in: self.view, animated: true)
                                
                            } catch {
                                print(error)
                            }
                        }
                    }
                    
                } else {
                    let alertController = UIAlertController(title: "Whatsapp", message: "WhatsApp not installed.", preferredStyle: .alert)
                    
                    let OKAction = UIAlertAction(title: "OK", style: .default)
                    {
                        (action:UIAlertAction!) in
                        print("you have pressed OK button");
                    }
                    alertController.addAction(OKAction)
                    
                    self.present(alertController, animated: true, completion:nil)
                }
            }
        }
        
       
     
    }
    
    @IBAction func btnInstaGramClicked(sender: AnyObject) {
        
        self.postImage(image: imageShare!)
    }
    
    func postImage(image: UIImage, result:((Bool)->Void)? = nil) {
        guard let instagramURL = NSURL(string: "instagram://app") else {
            if let result = result {
                result(false)
            }
            return
        }
        
        do {
            try PHPhotoLibrary.shared().performChangesAndWait {
                let request = PHAssetChangeRequest.creationRequestForAsset(from: image)
                
                let assetID = request.placeholderForCreatedAsset?.localIdentifier ?? ""
                let shareURL = "instagram://library?LocalIdentifier=" + assetID
                
                if UIApplication.shared.canOpenURL(instagramURL as URL) {
                    if let urlForRedirect = NSURL(string: shareURL) {
                        UIApplication.shared.openURL(urlForRedirect as URL)
                    }
                }
            }
        } catch {
            if let result = result {
                result(false)
            }
        }
    }
    
  

    @IBAction func btnEmailClicked(sender: AnyObject) {
        
        self.postEmail()
    }
    
    func postEmail() {
         if MFMailComposeViewController.canSendMail()
         {
        let mail:MFMailComposeViewController = MFMailComposeViewController()
        mail.mailComposeDelegate = self
        mail.setSubject("Indian Rupee Photo frame")
        
        let image = imageShare
        let imageString = returnEmailStringBase64EncodedImage(image: image!)
            let emailBody = "<img src='data:image/png;base64,\(imageString)' width='\(String(describing: image?.size.width))' height='\(String(describing: image?.size.height))'>"
        
        mail.setMessageBody(emailBody, isHTML:true)
        
        self.present(mail, animated: true, completion:nil)
        }
        else
         {
            let alertController = UIAlertController(title: "Email", message: "This device cannot send email. Please Setup mail account on device.", preferredStyle: .alert)
            
            let OKAction = UIAlertAction(title: "OK", style: .default)
            {
                (action:UIAlertAction!) in
                print("you have pressed OK button");
            }
            alertController.addAction(OKAction)
            
            self.present(alertController, animated: true, completion:nil)
        }
    }
    
    func returnEmailStringBase64EncodedImage(image:UIImage) -> String {
        let imgData:NSData = UIImagePNGRepresentation(image)! as NSData;
        let dataString = imgData.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0))
        return dataString
    }
    
    @IBAction func btnbackClicked(sender: AnyObject) {
        
        _ = navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func btnCompanyURLClicked(sender: AnyObject) {
        
        let openLink = NSURL(string :"http://www.cousinsinfotech.com/")
        UIApplication.shared.openURL(openLink! as URL)
        
    }
    
       
        
}
