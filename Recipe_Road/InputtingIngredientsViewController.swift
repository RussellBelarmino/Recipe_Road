//
//  InputtingIngredientsViewController.swift
//  Recipe_Road
//
//  Created by CoopStudent on 2022-07-29.
//

import UIKit

class InputtingIngredientsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var ingredientPicker1: UIPickerView!
    @IBOutlet weak var ingredientPicker2: UIPickerView!
    @IBOutlet weak var ingredientPicker3: UIPickerView!
    @IBOutlet weak var addAThirdIngredient: UIButton!
    
    var ingredientPickerData: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Connect the data
        self.ingredientPicker1.delegate = self
        self.ingredientPicker1.dataSource = self
        self.ingredientPicker2.delegate = self
        self.ingredientPicker2.dataSource = self
        self.ingredientPicker3.delegate = self
        self.ingredientPicker3.dataSource = self
        
        // The data for the array
        ingredientPickerData = [
            "Ing1", "Ing2", "Ing3", "Ing4", "Ing 5", "Ing6"
        ]
        
        // Hiding the third ingredient picker
        ingredientPicker3.isHidden = true
    }
    
    // Number of columns (vertical) of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // Number of rows (horizontal), or choices of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ingredientPickerData.count
    }
    
    // The data to return the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ingredientPickerData[row]
    }
    
    // Function for if the button is pressed to add the third ingredient
    @IBAction func pressingToAddIngredient(_ sender: UIButton) {
        if sender.isSelected {
            sender.isHidden = true
            sender.isEnabled = false
            
            ingredientPicker3.isHidden = false
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
