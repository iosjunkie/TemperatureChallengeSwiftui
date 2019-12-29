//
//  Conversions.swift
//  Weather Test App
//
//  Created by Michael Pulsifer on 8/3/14.
//  U.S. Department of Labor.
//
//  The various parameter names may seem odd, but this was originally created for OSHA Heat Safety v.2.0
import Foundation

struct Conversions {

    static func fahrenheitToCelsius(tempInF:Double) -> Double {
        let celsius = (tempInF - 32.0) * (5.0/9.0)
        return celsius as Double
    }
    
    static func celsiusToFahrenheit(tempInC:Double) -> Double {
        let fahrenheit = (tempInC * 9.0/5.0) + 32.0
        return fahrenheit as Double
    }
    
    static func CelsiusToKelvin(tempInC:Double) -> Double {
        return tempInC + 273.15
    }
    
    static func KelvinToCelsius(tempInK: Double) -> Double {
        return tempInK - 273.15
    }
    
    static func fahrenheitToKelvin(tempInF:Double) -> Double {
        return fahrenheitToCelsius(tempInF: tempInF) + 273.15
    }
    
    static func KelvinToFahrenheit(tempInK: Double) -> Double {
        return (KelvinToCelsius(tempInK: tempInK) * 9.0/5.0) + 32.0
    }
}
