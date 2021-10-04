//
//  WeatherData.swift
//  weatherApplication
//
//  Created by alican on 3.10.2021.
//

import Foundation

struct WeatherData : Decodable{
    let name : String
    let main : Main
    let weather : [Weather]
}

struct Main : Decodable {
    let temp : Double
}

struct Weather : Decodable {
    let description : String
}

