//
//  SizeClassView.swift
//  Bookworm
//
//  Created by Dylan Perry on 8/9/20.
//

import SwiftUI

struct SizeClassView {
    @Environment(\.horizontalSizeClass) var sizeClass

}

extension SizeClassView: View {
    var body: some View {
        if sizeClass == .compact {
            return AnyView(
                VStack {
                    Text("Active size class:")
                    Text("COMPACT")
                }
                .font(.largeTitle)
            )
        } else {
            return AnyView(
                HStack {
                    Text("Active size class:")
                    Text("REGULAR")
                }
                .font(.largeTitle)
            )
        }
    }
}

struct SizeClassView_Previews: PreviewProvider {
    static var previews: some View {
        SizeClassView()
    }
}
