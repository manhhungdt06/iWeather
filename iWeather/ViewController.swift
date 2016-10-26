//
//  ViewController.swift
//  iWeather
//
//  Created by techmaster on 10/26/16.
//  Copyright © 2016 techmaster. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tempLbl: UILabel!
    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var quoteLbl: UILabel!
    @IBOutlet weak var tempBtn: UIButton!
    @IBOutlet weak var backgroudView: UIImageView!
    var quotes = ["Sometimes to do what's right..we must be steady and give up the things we desire the most..even our dreams.",
                 "People don't realize this, but loneliness is underrated.",
                 "Remember, with great power comes great responsibility.",
                 "Think different.","Gone with the wind."]
    
    
    var cityList = ["NewYork","Singapore","Bangkok","HaNoi","Jarkatar","Dubai","London","Berlin"]
    
    var backgroudImg = ["Blood","Moon","Sun"]
    
    var isCel : Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tempChange(_ sender: AnyObject) {
        isCel = !isCel
        var curTemp = Double((tempBtn.titleLabel?.text)!)
        if isCel {
            tempLbl.text = "C"
            curTemp = (curTemp! - 32) / 1.8
            tempBtn.setTitle(String(format: "%2.1f", curTemp!), for: UIControlState())
            
        } else {
            tempLbl.text = "F"
            curTemp = curTemp! * 1.8 + 32
            tempBtn.setTitle(String(format: "%2.1f", curTemp!), for: UIControlState())
        }
    }
    @IBAction func locationChange(_ sender: AnyObject) {
        let cityIndex = Int(arc4random_uniform(UInt32(cityList.count)))
        cityLbl.text = cityList[cityIndex]
        
        let quoteIndex = Int(arc4random_uniform(UInt32(quotes.count)))
        
        quoteLbl.text = quotes[quoteIndex]
        
        let imgIndex = Int(arc4random_uniform(UInt32(backgroudImg.count)))
        backgroudView.image = UIImage.init(named: backgroudImg[imgIndex])
        
        getTemp()
    }
    func getTemp() -> Void {
        let temp = String(format: "%2.1f", randomTemp())
        tempBtn.setTitle(temp, for: UIControlState())
    }
    func randomTemp() -> Double {
        if isCel {
            return Double(arc4random_uniform(20)+15) + Double(arc4random()) / Double(INT32_MAX)
        } else {
            return (Double(arc4random_uniform(20)+15) + Double(arc4random()) / Double(INT32_MAX)) * 1.8 + 32
        }
    }
}

