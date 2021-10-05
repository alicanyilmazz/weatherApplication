//
//  ViewController.swift
//  weatherApplication
//
//  Created by alican on 28.09.2021.
//

import UIKit

class WeatherViewController: UIViewController , UITextFieldDelegate , WeatherManagerDelegate {
  
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherManager.delegate = self
        searchTextField.delegate = self // Remember that 'self' refers to the current view controller.
    }


    @IBAction func searchPressed(_ sender: UIButton) {
        // if we tap into this method code endEditing and set it true , then it will tell the search field that we're done with editing and you can dismiss the keyboard.
        searchTextField.endEditing(true)
        print(searchTextField.text!)
    }
    
    // Asks the delegate if the text field should process the pressing of the return button.
    // We also have to return a true or false that tells the text field whether if it should actually process that return.
    // This is going to be exact time point when the return button gets pressed and I get to write some code to be triggered at this point.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Shortly --> dismissed the keyboard!
        searchTextField.endEditing(true)
        print(searchTextField.text!)
        return true
    }
    
    // Should I allow them to stop editing?
    // Here our view controller gets to decide what happens when the user tries to deselected the text field.
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != ""{
            return true
        }else{
            textField.placeholder = "Type something"
            return false
        }
    }
    
    // The code will be triggered as soon as any of the text fields on the screen are done with editing.
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = searchTextField.text{
            weatherManager.fetchWeather(cityName: city)
            
        }
        searchTextField.text = ""
    }
    
    func didUpdateWeather(_ weatherManager : WeatherManager , weather : WeatherModel){
        DispatchQueue.main.sync {
            self.temperatureLabel.text = weather.temperatureString
            conditionImageView.image = UIImage(systemName: weather.conditionName)
        }
        
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}


