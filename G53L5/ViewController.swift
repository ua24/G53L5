//
//  ViewController.swift
//  G53L5
//
//  Created by Ivan Vasilevich on 3/21/17.
//  Copyright © 2017 Smoosh Labs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var grebView: UIView!
    @IBOutlet weak var studentsListLabel: UILabel!
    
    let key = "robotSave"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print(UserDefaults.standard.object(forKey: key) ?? "nil")
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        displayStudentList(clear: false)
        
        let robot3 = ["dirrection": "right",
                      "posX": 0,
                      "posY": 0] as NSDictionary

//        
        UserDefaults.standard.set(robot3, forKey: key)
        UserDefaults.standard.synchronize()
//
//        
        let documentDirectoryURL =  try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        print(documentDirectoryURL.absoluteString)
        robot3.write(toFile: "\(documentDirectoryURL.path)/robotDict.plist", atomically: false)
        
        changeGreenViewColorToRandom()
        
//        
//        if let newRobot = NSDictionary(contentsOfFile: "/Users/ivanvasilevich/Desktop/robotDictColor.plist") as? [String : Any] {
//            print(newRobot)
//        }
        
    }
    
    
    func changeGreenViewColorToRandom() {
        grebView.backgroundColor = UIColor.randomColor()
        
    }
    
    func displayStudentList(clear: Bool) {
        
        if clear {
            studentsListLabel.text = nil
        }
        else {
            studentsListLabel.text = Students.allStudents.description
        }
        
        studentsListLabel.backgroundColor = UIColor(hex: "#91FFFF")
    }
    
    @IBAction func buttonOnepressed() {
        changeGreenViewColorToRandom()
    }
    
    @IBAction func button2pressed() {
        displayStudentList(clear: true)
    }
    
    @IBAction func button3pressed() {
        displayStudentList(clear: false)
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        let result = sender.tag == 1
        displayStudentList(clear: result)
        
    }


}

