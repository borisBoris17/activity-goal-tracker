//
//  ContentView.swift
//  activity-goal-tracker
//
//  Created by tucker bichsel on 02/06/2023.
//

import SwiftUI


struct ContentView: View {
    @State var theme = themes[0]
    
    func startActivity() {
        print("Activity started...")
    }
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Goal Tracker")
                    .font(.custom("Arial", size: 30))
                    .fontWeight(.bold)
                
                // This will be part of a carousel
                ZStack {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(theme.brandColor)
                        .frame(width: UIScreen.main.bounds.width - 20)
                    VStack {
                        Text("Outdoor Time")
                            .font(theme.headlineFont)
                            .padding()
                        GoalTrackerView(theme: theme)
                            .frame(width: UIScreen.main.bounds.width / 2)
                            .padding(.bottom, -1 * (UIScreen.main.bounds.width / 2) * 2 / 5)
                        CalendarView(
                            interval: .init(
                                start: .now.addingTimeInterval(-24 * 30 * 24 * 3600),
                                end: .distantFuture
                            ),
                            theme: theme
                        ).frame(width: UIScreen.main.bounds.width - 30)
                        
                        RecentActivities(theme: theme)
                        
                    }
                }
            }
            .background(theme.backgroundColor)
        }
        .padding(.top, 1)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
