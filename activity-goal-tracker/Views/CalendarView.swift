//
//  CalendarView.swift
//  activity-goal-tracker
//
//  Created by tucker bichsel on 07/06/2023.
//

import SwiftUI

struct CalendarView: UIViewRepresentable {
    let interval: DateInterval
    var theme: Theme
    @Environment(\.managedObjectContext) private var viewContext
    
    func makeUIView(context: Context) -> UICalendarView {
        let view = UICalendarView()
        let gregorianCalendar = Calendar(identifier: .gregorian)
        view.delegate = context.coordinator
        view.calendar = gregorianCalendar
        view.layer.cornerCurve = .continuous
        view.tintColor = UIColor(theme.secondaryColor)
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
            return .customView {
                let emoji = UILabel()
                emoji.text = "🚀"
                return emoji
            }
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView(interval: .init(
            start: .now.addingTimeInterval(-24 * 30 * 24 * 3600),
            end: .distantFuture
        ), theme: themes[0])
    }
}
