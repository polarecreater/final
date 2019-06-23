//
//  ColorViewController.swift
//  2017111245
//
//  Created by SWUCOMPUTER on 23/06/2019.
//  Copyright © 2019 SWUCOMPUTER. All rights reserved.
//

import UIKit
import CoreData
class ColorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBOutlet var donetext: UITextField!
    @IBOutlet var whotext: UITextField!
    var colorDone: String!
    @IBAction func buttonColor(_ sender: UIButton) {
       //let appDelegate = UIApplication.shared.delegate as! AppDelegate
        guard let colorData = sender.titleLabel?.text
            else {
            return
        }
        colorDone = colorData
    }
    func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    @IBAction func ButtonDone(_ sender: UIButton) {
        
        let context = self.getContext()
        let entity = NSEntityDescription.entity(forEntityName: "Color", in: context)
        
        let object = NSManagedObject(entity: entity!, insertInto: context)
        
        object.setValue(whotext.text, forKey: "who")
        object.setValue(donetext.text, forKey: "what")
        object.setValue(colorDone, forKey: "color")
        do {
            try context.save()
            print("saved!")
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
