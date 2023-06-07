//
//  ContentView.swift
//  activity-goal-tracker
//
//  Created by tucker bichsel on 02/06/2023.
//

import SwiftUI



struct CalendarView: UIViewRepresentable {
    let interval: DateInterval
    @Environment(\.managedObjectContext) private var viewContext
    
    func makeUIView(context: Context) -> UICalendarView {
        let view = UICalendarView()
        let gregorianCalendar = Calendar(identifier: .gregorian)
        view.delegate = context.coordinator
        view.calendar = gregorianCalendar
        view.layer.cornerCurve = .continuous
        view.tintColor = UIColor.systemTeal
        view.availableDateRange = interval
        return view
    }
    
    func makeCoordinator() -> MyEventDatabase {
        MyEventDatabase(parent: self)
    }
    
    func updateUIView(_ uiView: UICalendarView, context: Context) {
        
    }
    
    class MyEventDatabase: NSObject, UICalendarViewDelegate {
        var parent: CalendarView
        
        init(parent: CalendarView) {
            self.parent = parent
        }
        
        @MainActor func calendarView(_ calendarView: UICalendarView, decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
            //        return nil
            return .customView {
                print("here")
                let emoji = UILabel()
                emoji.text = "🚀"
                return emoji
            }
        }
    }
}

struct ContentView: View {
    
    func startActivity() {
        print("Activity started...")
    }
    
    var body: some View {
        ScrollView {
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(.pink)
                        .frame(width: UIScreen.main.bounds.width - 10, height: 200)
                    Text("Section to display the goal progress.")
                }
                Button {
                    startActivity()
                } label: {
                    Text("START ACTIVITY")
                        .padding(20)
                        .frame(width: UIScreen.main.bounds.width - 10)
                }
                .background(.pink)
                .clipShape(Capsule())
                HStack {
                    Spacer()
                    ZStack {
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(.gray)
                        //                        .frame(width: UIScreen.main.bounds.width - 10)
                        VStack {
                            ZStack {
                                
                                Text("Active Days")
                                    .font(.title)
                            }
                            CalendarView(
                                interval: .init(
                                    start: .now.addingTimeInterval(-24 * 30 * 24 * 3600),
                                    end: .distantFuture
                                )
                            )
                        }
                    }
                    Spacer()
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(.pink)
                        .frame(width: UIScreen.main.bounds.width - 10, height: 400)
                    Text("Section to display recent activities.")
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
