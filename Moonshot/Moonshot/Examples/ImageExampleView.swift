//
//  ImageExampleView.swift
//  Moonshot
//
//  Created by Dylan Perry on 7/31/20.
//  Copyright © 2020 dperry.io. All rights reserved.
//

import SwiftUI

struct ImageExampleView: View {
    var body: some View {
        VStack {
            Image("HuntLibrary")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 300)
            
            Image("HuntLibrary")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 300)
        }
    }
}

struct ImageExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ImageExampleView()
    }
}
