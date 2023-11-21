//
//  ContentView.swift
//  Slider In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 21/11/23.
//

import SwiftUI

struct ContentView: View {
    @State private var volume: Double = 0.0
    @State private var sliderHasChanged: Bool = false
    
    private let range: ClosedRange<Double> = 0...100
    private let step: Double = 5
    
    var body: some View {
        VStack {
            self.helloWorldView(with: "One")
            HStack {
                self.decreaseButton()
                self.rangeWithStepSlider()
                self.increaseButton()
            }
            .padding(.bottom, 30)
            self.volumeLabel()
            Divider()
                .padding(.bottom, 50)
            
            // ====================== COMPONENT SEPARATOR==============================
            
            self.helloWorldView(with: "Two")
            HStack {
                self.decreaseButton()
                self.minAndMaxLabelSlider()
                self.increaseButton()
            }
            .padding(.bottom, 30)
            self.volumeLabel()
                .padding(.bottom, 50)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

extension ContentView {
    private func helloWorldView(with value: String) -> some View {
        return VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, Slider \(value)!")
                .font(.headline)
        }
        .padding(.bottom, 30)
    }
    
    
    private func rangeWithStepSlider() -> some View {
        return Slider(value: self.$volume,
                      in: self.range,
                      step: self.step) { hasChanged in
            self.sliderHasChanged = hasChanged
        }
    }
    
    private func minAndMaxLabelSlider() -> some View {
        return Slider(value: self.$volume, in: self.range, step: self.step) {
            EmptyView()
        } minimumValueLabel: {
            Text("\(self.range.lowerBound.formatted())")
                .font(.headline)
        } maximumValueLabel: {
            Text("\(self.range.upperBound.formatted())")
                .font(.headline)
        } onEditingChanged: { hasChanged in
            self.sliderHasChanged = hasChanged
        }
        
    }
    
    private func increaseButton() -> some View {
        return Button { withAnimation { self.increase() } } label: {
            Image(systemName: "speaker.plus")
                .imageScale(.large)
                .symbolVariant(.fill)
        }
        .disabled(self.sliderHasChanged)
    }
    
    private func decreaseButton() -> some View {
        return Button { withAnimation { self.decrease() } } label: {
            Image(systemName: "speaker.minus")
                .imageScale(.large)
                .symbolVariant(.fill)
        }
        .disabled(self.sliderHasChanged)
    }
    
    private func volumeLabel() -> some View {
        return Label(
            title: { Text("Current volume: \(self.volume.formatted())%") },
            icon: { Image(systemName: "plus.forwardslash.minus") }
        )
    }
    
    
}

extension ContentView {
    private func increase() -> Void {
        guard self.volume < self.range.upperBound else { return }
        self.volume += self.step
    }
    
    private func decrease() -> Void {
        guard self.volume > self.range.lowerBound else { return }
        self.volume -= self.step
    }
}
