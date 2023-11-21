//
//  ContentView.swift
//  DatePicker In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 21/11/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedDate: Date = .now
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                Label {
                    Text("Selected Date")
                        .bold()
                } icon: {
                    Image(systemName: "calendar.badge.exclamationmark")
                        .imageScale(.large)
                }
                .padding(.bottom, 10)
                HStack {
                    Text(self.selectedDate, style: .date)
                    Text("at")
                    Text(self.selectedDate, style: .time)
                }
                Divider()
                    .padding(.bottom, 50)
                
                // ====================== COMPONENT SEPARATOR==============================
                
                DatePicker(selection: self.$selectedDate, displayedComponents: [.date, .hourAndMinute]) {
                    HStack {
                        Image(systemName: "calendar.badge.plus")
                            .imageScale(.large)
                        Text("Select New Date Time")
                            .bold()
                    }
                }
                Divider()
                    .padding(.bottom, 10)
                
                // ====================== COMPONENT SEPARATOR==============================
                
                HStack {
                    Image(systemName: "calendar.badge.plus")
                        .imageScale(.large)
                    Text("Select New Date")
                        .bold()
                }
                DatePicker("",
                           selection: self.$selectedDate,
                           displayedComponents: .date)
                .labelsHidden()
                Divider()
                    .padding(.bottom, 10)
                
                // ====================== COMPONENT SEPARATOR==============================
                
                
                DatePicker(selection: self.$selectedDate,
                           in: self.eligibleDateRange(),
                           displayedComponents: .date) {
                    HStack {
                        Image(systemName: "calendar.badge.plus")
                            .imageScale(.large)
                        Text("Select Only 18's Date")
                            .bold()
                    }
                }
                Divider()
                    .padding(.bottom, 10)
                
                // ====================== COMPONENT SEPARATOR==============================
                
                HStack {
                    Image(systemName: "calendar.badge.plus")
                        .imageScale(.large)
                    Text("Select Wheel Date")
                        .bold()
                }
                DatePicker("",
                           selection: self.$selectedDate,
                           displayedComponents: .date)
                .datePickerStyle(.wheel)
                .labelsHidden()
                Divider()
                    .padding(.bottom, 10)
                
                // ====================== COMPONENT SEPARATOR==============================
                
                HStack {
                    Image(systemName: "calendar.badge.plus")
                        .imageScale(.large)
                    Text("Select Graphical Date")
                        .bold()
                }
                DatePicker("",
                           selection: self.$selectedDate,
                           displayedComponents: .date)
                .datePickerStyle(.graphical)
                .labelsHidden()
                Divider()
                    .padding(.bottom, 10)
                
                // ====================== COMPONENT SEPARATOR==============================
            }
            
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.yellow)
    }
}

#Preview {
    ContentView()
}

extension ContentView {
    private func eligibleDateRange() -> ClosedRange<Date> {
        let calendar = Calendar.current
        let minAgeDate = calendar.date(byAdding: .year, value: -18, to: .now)!
        let maxAgeDate = calendar.date(byAdding: .year, value: -120, to: .now)!
        
        return maxAgeDate...minAgeDate
    }
}
