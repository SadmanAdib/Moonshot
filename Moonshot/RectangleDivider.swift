//
//  RectangleDivider.swift
//  Moonshot
//
//  Created by Sadman Adib on 27/6/22.
//

import SwiftUI

struct RectangleDivider: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundColor(.lightBackground)
            .padding(.vertical)
    }
}

struct RectangleDivider_Previews: PreviewProvider {
    static var previews: some View {
        RectangleDivider()
    }
}
