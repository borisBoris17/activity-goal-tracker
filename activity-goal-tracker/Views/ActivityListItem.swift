//
//  ActivityListItem.swift
//  activity-goal-tracker
//
//  Created by tucker bichsel on 08/06/2023.
//

import SwiftUI

struct ActivityListItem: View {
    var name: String
    var theme: Theme
    
    var body: some View {
        HStack {
            Text(name)
                .font(theme.subTitleFont)
            Spacer()
            Text("Edit Button")
                .font(theme.subTitleFont)
        }
        .padding()
    }
}

struct ActivityListItem_Previews: PreviewProvider {
    static var previews: some View {
        ActivityListItem(name: "Some Name", theme: themes[0])
    }
}
