//
//  ContentView.swift
//  CeviCalculator
//
//  Created by Алексей Гайдуков on 04.10.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var chekAmout = ""
    @State private var numberOfPeople = 2
    @State private var tipPresentage = 0
    
    let tipPresentages = [0, 5, 10, 15, 20]
    
    var total: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPresentages[tipPresentage])
        let orderAmout = Double(chekAmout) ?? 0
        let tipValue = orderAmout / 100 * tipSelection
        let grandTotal = orderAmout + tipValue
        let amoutPerson = grandTotal / peopleCount
        
        return amoutPerson
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount", text: $chekAmout)
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                Section("How many teapots do you want to keep") {
                    Picker("Tip persentage", selection: $tipPresentage) {
                        ForEach(0..<tipPresentages.count) {
                            Text("\(self.tipPresentages[$0]) %")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section {
                    Text("\(total, specifier: "%.2f")")
                }
                .navigationTitle("Calculate Chevi")
            }
        }
        
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
