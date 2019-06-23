//
//  NewTeamViewController.swift
//  2017111245
//
//  Created by SWUCOMPUTER on 23/06/2019.
//  Copyright © 2019 SWUCOMPUTER. All rights reserved.
//

import UIKit
import CoreData

class NewTeamViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBOutlet var pickpick: UIPickerView!
    
    let gpaArray: Array<String> = ["1", "2", "3", "P/F"]
    let categoryArray: Array<String> = ["전필", "전선", "교필", "교선", "동아리"]
    let difficultyArray: [String] = ["쉬움", "보통", "어려움","밤샘각"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return gpaArray.count
        } else if component == 1{
            return categoryArray.count
        } else {
            return difficultyArray.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return gpaArray[row] }
        else if component == 1{
            return categoryArray[row] }
        else {
            return difficultyArray[row] }
    }
    
    @IBOutlet var teamName: UITextField!
    @IBOutlet var labelStatus: UILabel!
   
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool { // delegate 연결
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func buttonCreate() {
        let gpa: String = gpaArray[pickpick.selectedRow(inComponent: 0)]
        let category: String = categoryArray[pickpick.selectedRow(inComponent: 1)]
        let difficulty: String = difficultyArray[pickpick.selectedRow(inComponent: 2)]
        
        /*guard let gpa = gpaArray[levelPicker.selectedRow(inComponent: 0)] else {
            return
        }
        guard let category = categoryArray[levelPicker.selectedRow(inComponent: 1)] else {
            return
        }
        guard let difficulty = difficultyArray[levelPicker.selectedRow(inComponent: 2)] else {
            return
        }
        */
        //let gpa: String = gpaArray[levelPicker.selectedRow(inComponent: 0)]
        //let category: String = categoryArray[levelPicker.selectedRow(inComponent: 1)]
        //let difficulty: String = difficultyArray[levelPicker.selectedRow(inComponent: 2)]
        
        if teamName.text == "" {
            labelStatus.text = "이름을 입력하세요";
            return;
        }
        
        let context = self.getContext()
        let entity = NSEntityDescription.entity(forEntityName: "Team", in: context)
        //guard let entity = NSEntityDescription.entity(forEntityName: "Teams", in: context) else {
          //  return
        //}
        let object = NSManagedObject(entity: entity!, insertInto: context)
        object.setValue(teamName.text, forKey: "name")
        object.setValue(category, forKey: "category")
        object.setValue(difficulty, forKey: "difficulty")
        object.setValue(gpa, forKey: "gpa")
        
        do {
            try context.save()
            print("saved!")
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
        self.navigationController?.popViewController(animated: true)
        //let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //let RootView = storyboard.instantiateViewController(withIdentifier: "RootView")
        //self.present(RootView, animated: true, completion: nil)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    */

}
