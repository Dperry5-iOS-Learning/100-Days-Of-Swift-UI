//
//  Moonshot.swift
//  Moonshot
//
//  Created by Dylan Perry on 7/31/20.
//  Copyright © 2020 dperry.io. All rights reserved.
//

import SwiftUI

struct Moonshot {
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let showAstronautsText = "Show Astronauts"
    let showLaunchDateText = "Show Launch Date"
    
    @State
    var buttonText = "Show Astronauts"
    
    @State
    var isShowingLaunchDate = true

}

extension Moonshot: View {
    var body: some View {
        NavigationView {
            List(missions) { mission in
                NavigationLink(destination: MissionView(mission: mission, astronauts: self.astronauts)) {
                    Image(mission.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 44, height: 44)

                    VStack(alignment: .leading) {
                        Text(mission.displayName)
                            .font(.headline)
                        Text(self.isShowingLaunchDate ? mission.formattedLaunchDate : mission.formattedAstronauts)
                    }
                }
            }
            .navigationBarTitle("Moonshot")
            .navigationBarItems(trailing:
                Button(self.buttonText) {
                    self.isShowingLaunchDate.toggle()
                    self.buttonText = self.isShowingLaunchDate ? self.showAstronautsText : self.showLaunchDateText
                }
            )
        }
    }
}

struct Moonshot_Previews: PreviewProvider {
    static var previews: some View {
        Moonshot()
    }
}
