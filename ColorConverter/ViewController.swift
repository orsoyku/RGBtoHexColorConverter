//
//  ViewController.swift
//  ColorConverter
//
//  Created by öykü örs on 26.02.2020.
//  Copyright © 2020 öykü örs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var selectedIndex : Int = 0


    @IBOutlet weak var lblSelectedColor: UILabel!
    @IBOutlet weak var btnConvert: UIButton!
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var txtBlue: UITextField!
    @IBOutlet weak var txtGreen: UITextField!
    @IBOutlet weak var txtRed: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        
        selectedIndex = sender.selectedSegmentIndex
        lblResult.text?.removeAll()
        txtRed.text?.removeAll()
        txtBlue.text?.removeAll()
        txtGreen.text?.removeAll()
        lblSelectedColor.backgroundColor = UIColor.white
        
        if(selectedIndex == 0) {
            btnConvert.setTitle("RGB - HEX CONVERT", for: .normal)
        }
        else {
            btnConvert.setTitle(("HEX - RGB CONVERT"), for: .normal)
        }

        
    }

    @IBAction func btnConvertClicked(_ sender: UIButton) {
        
        switch selectedIndex {
        case 0:
            convertRGBtoHEX()
        case 1:
            convertHEXtoRGB()
        default:
            break
        }
    }
    
    func convertRGBtoHEX() {
        
        if let redValue = UInt8(txtRed.text!) {
            if let greenValue = UInt8(txtGreen.text!) {
                if let blueValue = UInt8(txtBlue.text!) {
                    //if the code comes to here, user has been entered correctly.
                    let redHex = String(format: "%2X",redValue)
                    let greenHex = String(format: "%2X",greenValue)
                    let blueHex = String(format: "%2X",blueValue)
                    
                    lblResult.text = "HEX Color : #\(redHex)\(greenHex)\(blueHex)"
                    lblSelectedColor.backgroundColor = UIColor(red: CGFloat(redValue)/255, green: CGFloat(greenValue)/255, blue: CGFloat(blueValue)/255, alpha: 1)
                }
            }
        }
        
    }
    func convertHEXtoRGB() {
        if let redValue = UInt8(txtRed.text!, radix: 16) {
            if let greenValue = UInt8(txtGreen.text!, radix: 16) {
                if let blueValue = UInt8(txtBlue.text!, radix:16) {
                    
                    lblResult.text = "RED : \(redValue) GREEN : \(greenValue) BLUE: \(blueValue)"
                    lblSelectedColor.backgroundColor = UIColor(red: CGFloat(redValue)/255, green: CGFloat(greenValue)/255, blue: CGFloat(blueValue)/255, alpha: 1)
        
            }
        }
    }
        
    
 }
    
    
}


