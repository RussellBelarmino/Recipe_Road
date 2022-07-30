//
//  InputtingIngredientsViewController.swift
//  Recipe_Road
//
//  Created by CoopStudent on 2022-07-29.
//

import UIKit

class InputtingIngredientsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var ingredientPicker1: UIPickerView!
    
    var ingredientPickerData: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Connect the data
        self.ingredientPicker1.delegate = self
        self.ingredientPicker1.dataSource = self
        
        // The data for the array
        ingredientPickerData = [
            "Ing1", "Ing2", "Ing3", "Ing4", "Ing 5", "Ing6"
        ]
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
