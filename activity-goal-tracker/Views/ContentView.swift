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
                ZStack {
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(theme.brandColor)
                        .frame(width: UIScreen.main.bounds.width - 10, height: 100)
                    VStack {
                        Text("Outdoor Time")
                            .font(theme.headlineFont)
                            .foregroundColor(theme.bodyTextColor)
                        HStack {
                            Text("3 hrs")
                            Text("/")
                            Text("1000 hrs")
                        }
                        .font(theme.subTitleFont)
                    }
                }
                Button {
                    startActivity()
                } label: {
                    Text("START ACTIVITY")
                        .padding(20)
//                        .frame(width: UIScreen.main.bounds.width / 2)
                        .foregroundColor(theme.bodyTextColor)
                }
                .background(theme.brandColor)
                .clipShape(Capsule())
                HStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(theme.brandColor)
                                                .frame(width: UIScreen.main.bounds.width - 10)
                        VStack {
                            ZStack {
                                
                                Text("Active Days")
                                    .font(theme.buttonFont)
                                    .padding()
                            }
                            CalendarView(
                                interval: .init(
                                    start: .now.addingTimeInterval(-24 * 30 * 24 * 3600),
                                    end: .distantFuture
                                ),
                                theme: theme
                            )
                        }
                    }
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(theme.brandColor)
                        .frame(width: UIScreen.main.bounds.width - 10, height: 400)
                    Text("Section to display recent activities.")
                }
            }
            .padding()
        }
        .background(theme.backgroundColor)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
