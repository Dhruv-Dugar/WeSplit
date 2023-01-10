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
        NavigationView {
                Form{
                    Section{
                        TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "INR"))
                            .keyboardType(.decimalPad)
                        
                        Picker("Number of people", selection: $numberOfPeople) {
                            ForEach(2..<100){
                                Text("\($0)")
                            }
                        }
                    }
                    
                    Section{
//                        tip chooser
                        Picker(
                            "Tip percentage", selection: $tipPercentage) {
                            ForEach(tipPercentages, id: \.self) {
                                Text($0, format: .percent)
                            }
                            }.pickerStyle(.segmented)
                    } header: {
                        Text("Tip Percentage")
                    }
                    Section{
                        Text(checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                    }
                }.navigationTitle("WeSplit")
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
