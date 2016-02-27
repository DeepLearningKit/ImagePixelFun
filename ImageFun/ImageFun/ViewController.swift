//
//  ViewController.swift
//  ImageFun
//
//  Created by Neeraj Kumar on 11/11/14.
//  Copyright (c) 2014 Neeraj Kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let image:UIImage = UIImage(named: "images.jpeg")!
        
        for i in 0...100 {
            for j in 0...100 {
                image.setPixelColorAtPoint(CGPoint(x: i,y: j), color: UIImage.RawColorType(255,0,0,100))
            }
        }

        
        // Displaying original image.
        var originalImageView:UIImageView = UIImageView(frame: CGRectMake(20, 20, image.size.width, image.size.height))
        originalImageView.image = image
        self.view.addSubview(originalImageView)
        
        // GrayScaled image.
        var imageView:UIImageView = UIImageView(frame: CGRectMake(20, CGRectGetMaxY(originalImageView.frame) + 10, image.size.width, image.size.height))
        
        imageView.image = image.getGrayScale()

        self.view.addSubview(imageView)
        
        // Modify image colors.
        var modifiedImageView:UIImageView = UIImageView(frame: CGRectMake(20, CGRectGetMaxY(imageView.frame) + 10, image.size.width, image.size.height))
        modifiedImageView.image = image.applyOnPixels({ (point, redColor, greenColor, blueColor, alphaValue) -> (newRedColor: UInt8, newgreenColor: UInt8, newblueColor: UInt8, newalphaValue: UInt8) in
            
             let avg = (UInt32(redColor) + UInt32(greenColor) + UInt32(blueColor))/3
            if (Double(UInt32(redColor)) > (Double(avg) * 1.8)) {
                return (0,200,100,255)
            }
            else {
                return (redColor,greenColor,blueColor,alphaValue)
            }

        })
        self.view.addSubview(modifiedImageView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

