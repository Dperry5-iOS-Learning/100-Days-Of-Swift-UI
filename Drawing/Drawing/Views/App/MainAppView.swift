//
//  MainAppView.swift
//  Drawing
//
//  Created by Dylan Perry on 8/1/20.
//  Copyright © 2020 dperry.io. All rights reserved.
//

import SwiftUI

struct MainAppView: View {
    var body: some View {
        Text("Hello, This is the main app!")
        .navigationBarTitle(Text("Drawing"))
    }
}

struct MainAppView_Previews: PreviewProvider {
    static var previews: some View {
        MainAppView()
    }
}
