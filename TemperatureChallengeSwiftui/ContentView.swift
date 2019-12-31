//
//  ContentView.swift
//  TemperatureChallengeSwiftui
//
//  Created by Jules Lee on 12/30/19.
//  Copyright © 2019 Jules Lee. All rights reserved.
//

import SwiftUI
enum Units: String, CaseIterable {
    case Celsius = "Celsius"
    case Fahrenheit = "Fahrenheit"
    case Kelvin = "Kelvin"
}

extension Units: Identifiable {
    var id: UUID {
        return UUID()
    }
}

struct ContentView: View {
    @State private var temp = ""
    @State private var fromTemp = Units.allCases.randomElement()!
    @State private var toTemp = Units.allCases.randomElement()!
    var result: Double {
        let tempD = Double(temp) ?? 0
        switch fromTemp {
        case Units.Celsius:
            switch toTemp {
            case Units.Fahrenheit:
                return Conversions.celsiusToFahrenheit(tempInC: tempD)
            case Units.Kelvin:
                return Conversions.CelsiusToKelvin(tempInC: tempD)
            default:
                return tempD
            }
        case Units.Fahrenheit:
            switch toTemp {
            case Units.Celsius:
                return Conversions.fahrenheitToCelsius(tempInF: tempD)
            case Units.Kelvin:
                return Conversions.fahrenheitToKelvin(tempInF:tempD)
            default:
                return tempD
            }
        case Units.Kelvin:
            switch toTemp {
            case Units.Fahrenheit:
                return Conversions.KelvinToFahrenheit(tempInK: tempD)
            case Units.Celsius:
                return Conversions.KelvinToCelsius(tempInK: tempD)
            default:
                return tempD
            }
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Value to convert", text: $temp)
                }
                Section(header: Text("From")) {
                    Picker("Unit of measurement", selection: $fromTemp) {
                        ForEach(Units.allCases) { unit in
                            Text(unit.rawValue).tag(unit)
                        }
                        }.pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("To")) {
                    Picker("Unit of measurement", selection: $toTemp) {
                        ForEach(Units.allCases) { unit in
                            Text(unit.rawValue).tag(unit)
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                Section {
                    Text("\(result, specifier: "%.2f")")
                }
            }
            .navigationBarTitle("Temperature Conversion", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice(PreviewDevice(rawValue: "iPhone 8 Plus")).previewDisplayName("iPhone 8 Plus")
    }
}
