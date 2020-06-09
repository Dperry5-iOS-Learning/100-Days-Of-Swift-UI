//
//  PlayerOptions.swift
//  RockPaperScissors
//
//  Created by Dylan Perry on 6/9/20.
//  Copyright © 2020 dperry.io. All rights reserved.
//

import SwiftUI

struct PlayerOptions {
    let options: [String]
    let action: (Int) -> Void
}


extension PlayerOptions: View {
    var body: some View {
        HStack {
            Spacer()
            ForEach(0..<options.count){ index in
                Spacer()
                Button(action: {
                    self.action(index)
                }, label: {
                    Text(self.options[index])
                    .optionStyle()
                })
                Spacer()
            }
            Spacer()
            
        }
    }
}

struct PlayerOptions_Previews: PreviewProvider {
    private static func printValue(_ value: Int){
        print(value)
    }
    static var previews: some View {
        PlayerOptions(options: ["Rock", "Paper", "Scissors"], action: printValue)
    }
}
