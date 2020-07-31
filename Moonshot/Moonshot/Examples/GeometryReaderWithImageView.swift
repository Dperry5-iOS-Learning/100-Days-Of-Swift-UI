//
//  GeometryReaderWithImageView.swift
//  Moonshot
//
//  Created by Dylan Perry on 7/31/20.
//  Copyright © 2020 dperry.io. All rights reserved.
//

import SwiftUI

struct GeometryReaderWithImageView: View {
    var body: some View {
        VStack {
            GeometryReader { geo in
                Image("HuntLibrary")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 300)
            }
        }
    }
}

struct GeometryReaderWithImageView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaderWithImageView()
    }
}
