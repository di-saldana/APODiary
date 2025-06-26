//
//  CalendarView.swift
//  APODiary
//
//  Created by Dianelys Saldaña on 6/25/25.
//

import SwiftUI

struct CalendarView: View {
    @State private var date =  Date.now
    @State private var days: [Date] = []
    //    let days = 1..<32
    
    let daysOfWeek = ["SUN", "MON", "TUE", "WED","THU", "FRI", "SAT"]
    let columns = Array(repeating: GridItem(.flexible()), count: 7)
    
    var body: some View {
        VStack {
            LabeledContent("Select Date") {
                DatePicker("", selection: $date, displayedComponents: .date)
                    .frame(maxWidth: .infinity)
            }
            
            HStack {
                ForEach(daysOfWeek.indices, id: \.self) { index in
                    Text(daysOfWeek[index])
                        .fontWeight(.bold)
                        .foregroundStyle(.secondary)
//                        .fontWidth(.compressed)
                        .frame(maxWidth: .infinity)
                }
            }
            
            LazyVGrid(columns: columns) {
                ForEach(days, id: \.self) { day in
                    
                    if day.monthInt != date.monthInt {
                            Text("")
                    } else {
                        Text(day.formatted(.dateTime.day()))
                            .fontWeight(.bold)
                            .foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity, minHeight: 40)
                            .background(
                                Circle()
                                    .foregroundStyle(
                                        Date.now.startOfDay == day.startOfDay ? .red.opacity(0.3)
                                        :.blue.opacity(0.3))
                            )
                    }
                }
            }
        }
        .padding()
                .onAppear {
                    days = date.calendarDisplayDays
                }
                .onChange(of: date) {
                    days = date.calendarDisplayDays
                }
    }
}

#Preview {
    CalendarView()
}
