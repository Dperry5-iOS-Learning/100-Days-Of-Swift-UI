//
//  Edutainment.swift
//  Edutainment
//
//  Created by Dylan Perry on 7/11/20.
//  Copyright © 2020 dperry.io. All rights reserved.
//

import SwiftUI

struct Edutainment {
    @State var multiplicationMax: Int = 1
    @State var numberOfQuestionsIdx: Int = 0
    @State var playGame = false
    
    let numberOfQuestions = ["5", "10", "20", "All"]
    
}

extension Edutainment: View {
    public var body: some View {
        NavigationView {
            VStack {
                Text("Lets do multiplication! Configure the game below!")
                    .padding()
                
                Form {
                    Section(header: Text("Select the Multiplicate Range")) {
                        Stepper("Current Max: \(multiplicationMax)", value: $multiplicationMax, in: 1...12)
                    }
                                    
                    Section(header: Text("Select Number of Questions")) {
                        Picker(selection: $numberOfQuestionsIdx, label: Text("Number of Questions")) {
                            ForEach(0 ..< numberOfQuestions.count) {
                                Text(self.numberOfQuestions[$0]).tag($0)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    
                    NavigationLink(destination: MultiplicationGame(multiplicationMax: self.multiplicationMax, numberOfQuestions: self.numberOfQuestions[self.numberOfQuestionsIdx]), isActive: $playGame){
                        Button(action: {
                            self.playGame.toggle()
                        }) {
                            Text("Lets Play!")
                            .frame(maxWidth: .infinity, alignment: .center)
                        }
                    }
                }

            }
        .navigationBarTitle(Text("Edutainment"), displayMode: .inline)
        }
    }
}

struct Edutainment_Previews: PreviewProvider {
    static var previews: some View {
        Edutainment()
    }
}
