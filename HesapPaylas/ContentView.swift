//
//  ContentView.swift
//  HesapPaylas
//
//  Created by EDA BARUTÇU on 11.11.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = ""
    @State private var numberOfpeople = 2
    @State private var tipPercentage = 2
     
    let tipPercentages = [10, 15, 20, 25 ,0]
    
    var TotalPerperson: Double {
        let peopleCount = Double(numberOfpeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerson = grandTotal / peopleCount
        
        
        return amountPerson
    }
    
    var body: some View {
           NavigationView {
               Form {
                   Section {
                       TextField("Amount", text: $checkAmount)
                           .keyboardType(.decimalPad)
                       
                       Picker("Number of people",selection: $numberOfpeople) {
                           ForEach(2 ..< 100){
                               Text("\($0) people")
                           }
                       }
                   }
                   
                   Section {
                                       Picker("Tip Percentage", selection: $tipPercentage) {
                                           ForEach(0 ..< tipPercentages.count) {
                                               Text("\(self.tipPercentages[$0])%")
                                           }
                                       }.pickerStyle(.segmented)
                                                     } header: {
                                                         Text("How much tip do you want to leave?")
                                                     }
                                                     
                                                     Section {
                                                         Text("$\(TotalPerperson, specifier: "%.2f")")
                                                     }
                                                     
                                                     Section {
                                                         Text("Eda.")
                                                     }
                                                 }
                                                 .navigationTitle("Hesabını Paylaş")
                                                 .navigationBarTitleDisplayMode(.inline)
                                             }
                                         }
                                     }

                                     struct ContentView_Previews: PreviewProvider {
                                         static var previews: some View {
                                             ContentView()
                                         }
                                     }
