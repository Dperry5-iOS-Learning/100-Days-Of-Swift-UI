//
//  EmojiRatingView.swift
//  Bookworm
//
//  Created by Dylan Perry on 8/9/20.
//

import SwiftUI

struct EmojiRatingView {
    let rating: Int16

}

extension EmojiRatingView: View {
    var body: some View {
        switch rating {
        case 1:
            return Text("1")
        case 2:
            return Text("2")
        case 3:
            return Text("3")
        case 4:
            return Text("4")
        default:
            return Text("5")
        }
    }
}

struct EmojiRatingView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiRatingView(rating: 3)
    }
}
