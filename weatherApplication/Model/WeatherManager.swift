//
//  WeatherManager.swift
//  weatherApplication
//
//  Created by alican on 30.09.2021.
//

import Foundation

struct WeatherManager{
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=2557e0a34612e91b204f36b6099bd203&units=metric"
    
    func fetchWeather(cityName : String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString : String){
        //1.Create Url
        if let url = URL(string: urlString){
        //2.Create a URLSession
        let session = URLSession(configuration: .default)
        //3. Give the session a task
        let task = session.dataTask(with: url, completionHandler: handle(data:response:error:))
        //4.Start task
        task.resume()
        }
    }
    
    func handle(data : Data? , response : URLResponse? , error : Error?) -> Void{
        if error != nil{
            print(error!)
            return
        }
        
        if let safeData = data{
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString!)
        }
    }
}
