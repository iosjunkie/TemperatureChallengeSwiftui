//
//  ContentView.swift
//  TemperatureChallengeSwiftui
//
//  Created by Jules Lee on 12/30/19.
//  Copyright © 2019 Jules Lee. All rights reserved.
//

import SwiftUI
enum Units: String {
    case Celsius = "Celsius"
    case Fahrenheit = "Fahrenheit"
    case Kelvin = "Kelvin"
}

struct ContentView: View {
    @State private var temp = ""
    @State private var from = Units.Celsius.rawValue
    @State private var to = Units.Fahrenheit.rawValue
    private let units = [Units.Celsius, Units.Fahrenheit, Units.Kelvin]
    private var result: Double {
        let tempD = Double(temp) ?? 0
        switch from {
        case Units.Celsius.rawValue:
            switch to {
            case Units.Fahrenheit.rawValue:
                return Conversions.celsiusToFahrenheit(tempInC: tempD)
            case Units.Kelvin.rawValue:
                return Conversions.CelsiusToKelvin(tempInC: tempD)
            default:
                return tempD
            }
        case Units.Fahrenheit.rawValue:
            switch to {
            case Units.Celsius.rawValue:
                return Conversions.fahrenheitToCelsius(tempInF: tempD)
            case Units.Kelvin.rawValue:
                return Conversions.fahrenheitToKelvin(tempInF:tempD)
            default:
                return tempD
            }
        case Units.Kelvin.rawValue:
            switch to {
            case Units.Fahrenheit.rawValue:
                return Conversions.KelvinToFahrenheit(tempInK: tempD)
            case Units.Celsius.rawValue:
                return Conversions.KelvinToCelsius(tempInK: tempD)
            default:
                return tempD
            }
        default:
            return tempD
        }
    }
    
    var body: some View {
        Form {
            Section {
                TextField("Value to convert", text: $temp)
            }
            Section(header: Text("From")) {
                Picker("Unit of measurement", selection: $from) {
                    ForEach(0 ..< units.count) {
                        Text(self.units[$0].rawValue)
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            Section(header: Text("To")) {
                Picker("Unit of measurement", selection: $to) {
                    ForEach(0 ..< units.count) {
                        Text(self.units[$0].rawValue)
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            Section {
                Text("\(result)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice(PreviewDevice(rawValue: "iPhone 8 Plus")).previewDisplayName("iPhone 8 Plus")
    }
}
