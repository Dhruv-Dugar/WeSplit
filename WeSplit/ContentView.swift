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
    @FocusState private var amountIsFocused : Bool
    let tipPercentages = [0, 10, 15, 25, 40]
    
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)

        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount

        return amountPerPerson
    }
    
    var body: some View{
        NavigationView {
                Form{
                    Section{
                        TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "INR"))
                            .keyboardType(.decimalPad)
                            .focused($amountIsFocused)
                        
                        Picker("Number of people", selection: $numberOfPeople) {
                            ForEach(2..<100){
                                Text("\($0)")
                            }
                        }
                    }
                    
                    Section{
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
                        Text(totalPerPerson, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                    } header: {
                        Text("Final amount per person")
                    }
                }.navigationTitle("WeSplit")
                .toolbar{
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Done") {
                            amountIsFocused = false
                        }
                    }
                }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
