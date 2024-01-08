//
//  ContentView.swift
//  Challenge_3_Edutainment
//
//  Created by Daniel Freire on 12/25/23.
//

import SwiftUI

struct ContentView: View {
    @State private var activeMultiplicationTable = 2
    @State private var numberOfQuestions = 5
    let amountOfQuestions = [5, 10, 20]
    var questions: [String] {
        var multipliers = Array(2...12)
        var questions = [String]()
        for question in 0..<numberOfQuestions {
            let multiplier = multipliers.randomElement() ?? 2
            print(multiplier)
            questions.append("\(activeMultiplicationTable) x \(multiplier)")
            let multiplierIndex = multipliers.firstIndex(of: multiplier) ?? 0
            multipliers.remove(at: multiplierIndex)
            print(multipliers)
        }
        return questions
    }
    
    
    var body: some View {
        NavigationStack {
            Form {
                Stepper("Table of \(activeMultiplicationTable)", value: $activeMultiplicationTable, in: 2...12)
                Picker("Number of questions", selection: $numberOfQuestions) {
                    ForEach(amountOfQuestions, id: \.self) { amount in
                        Text("\(amount)")
                    }
                }
                ForEach(questions, id: \.self) { question in
                    HStack {
                        Text(question)
                    }
                }
            }
            .navigationTitle("Edutainment")
            .toolbar {
                Button {
                    // settings
                } label: {
                    Image(systemName: "gear")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
