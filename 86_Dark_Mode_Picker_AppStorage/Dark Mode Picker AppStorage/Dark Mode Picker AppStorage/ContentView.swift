//
//  ContentView.swift
//  Dark Mode Picker AppStorage
//
//  Created by Bambang Tri Rahmat Doni on 10/12/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) private var colorScheme
    @AppStorage("systemTheme") private var systemTheme: Int =  SchemeType.allCases.first!.rawValue
    
    private var weatherText: String {
        return self.colorScheme == .light ? "Day Time" : "Night Time"
    }
    
    private var selectedScheme: ColorScheme? {
        guard let theme = SchemeType(rawValue: self.systemTheme) else { return nil }
        
        switch theme {
        case .light:
            return .light
        case .dark:
            return .dark
        default: return nil
        }
    }
    
    var body: some View {
        GeometryReader { geo in
            let width = geo.size.width
            let height = geo.size.height
            
            ZStack {
                Theme.appColor.ignoresSafeArea()
                
                VStack {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text("Hello, world!")
                }
                .font(.headline)
                .padding()
                .background(Material.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 15.0))
                .position(x: width / 2, y: height * 0.2 )
                
                VStack {
                    Assets.weatherImage
                        .resizable()
                        .frame(width: 200.0, height: 200.0)
                        .shadow(radius: 5.0)
                    
                    Text(self.weatherText)
                        .font(.system(size: 30.0, weight: .bold, design: .rounded))
                        .padding(.top, 20.0)
                }
                .position(x: width / 2, y: height * 0.55)
                
                Picker("Pick a Theme", selection: self.$systemTheme) {
                    ForEach(SchemeType.allCases) { type in
                        Text(type.title)
                            .tag(type.rawValue)
                    }
                }
                .font(.headline)
                .padding()
                .background(Material.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 15.0))
                .position(x: width / 2, y: height / 1.2 )
            }
        }
        .preferredColorScheme(self.selectedScheme)
    }
}

#Preview {
    ContentView()
}

enum Theme {
    static let appColor = Color("AppColor")
}

enum Assets {
    static let weatherImage = Image("WeatherIcon")
}

enum SchemeType: Int, Hashable, Identifiable, CaseIterable {
    var id: Self { return self }
    case system
    case light
    case dark
}

extension SchemeType {
    var title: String {
        switch self {
        case .system:
            return "📱 System"
        case .light:
            return "🌝 Light"
        case .dark:
            return "🌚 Dark"
        }
    }
}
