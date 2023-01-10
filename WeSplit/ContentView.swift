//
//  ContentView.swift
//  WeSplit
//
//  Created by Dhurv Dugar on 10/01/23.
//


import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    let tipPercentages = [0, 10, 15, 25, 40]
    
    var body: some View{
        Form{
            Section{
                TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "INR"))
                    .keyboardType(.decimalPad)
                                
                Picker("Number of people", selection: $numberOfPeople) {
                    ForEach(2 ..< 100){
                        Text("\($0)")
                    }
                }
            }
            
            Section {
                   Text(checkAmount, format: .currency(code: Locale.current.currencyCode ?? "INR"))
               }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
