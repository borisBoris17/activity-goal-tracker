//
//  RecentActivities.swift
//  activity-goal-tracker
//
//  Created by tucker bichsel on 08/06/2023.
//

import SwiftUI

struct RecentActivities: View {
    var theme: Theme
    
    var items:[String] = ["One Activity", "And Another", "One More"]
    
    var body: some View {
        VStack {
            Text("Recent Activities")
                .font(theme.headlineFont)
                .padding()
            VStack {
                LazyVStack(alignment: .leading, spacing: 10) {
                    ForEach(items, id: \.self) { item in
                        ActivityListItem(name: item, theme: theme)
                    }
                }.frame(width: UIScreen.main.bounds.width - 30)
            }
        }
    }
}

struct RecentActivities_Previews: PreviewProvider {
    static var previews: some View {
        RecentActivities(theme: themes[0])
    }
}
