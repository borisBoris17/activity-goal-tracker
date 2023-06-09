//
//  GoalTrackerView.swift
//  activity-goal-tracker
//
//  Created by tucker bichsel on 08/06/2023.
//

import SwiftUI

struct GoalTrackerView: View {
    var theme: Theme
    
    var body: some View {
        ZStack {
            Circle()
                .trim(from: 0.5, to: 1)
                .stroke(lineWidth: 5)
            Circle()
                .trim(from: 0.5, to: 0.75)
                .stroke(theme.secondaryColor, style: StrokeStyle(
                    lineWidth: 15,
                    lineCap: .round,
                    lineJoin: .miter,
                    miterLimit: 0
                ))
                .overlay {
                    Text("500 / 1000 hrs")
                        .font(theme.subTitleFont)
                        .offset(y: -50)
                }
        }
    }
}

struct GoalTrackerView_Previews: PreviewProvider {
    static var previews: some View {
        GoalTrackerView(theme: themes[0])
    }
}
