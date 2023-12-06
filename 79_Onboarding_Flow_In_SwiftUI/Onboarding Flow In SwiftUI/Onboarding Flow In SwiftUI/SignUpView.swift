//
//  SignUpView.swift
//  Onboarding Flow In SwiftUI
//
//  Created by Bambang Tri Rahmat Doni on 06/12/23.
//

import SwiftUI

struct SignUpView: View {
    @EnvironmentObject var sessionManager: SessionManager
    
    @StateObject private var registrationManager = RegistrationManager()
    
    @State private var isShowingPrevious = false
    @State private var isShowingTerms = false
    @State private var isRegistering = false
    
    var body: some View {
        ZStack {
            Color.teal
                .ignoresSafeArea()
            
            TabView(selection: self.$registrationManager.screenActive) {
                UsernameView(text: self.$registrationManager.currentUser.username) {
                    if self.registrationManager.hasValidUsername() {
                        self.registrationManager.nextScreen()
                    }
                }
                .tag(RegistrationManager.Screen.username)
                
                AgeView(age: self.$registrationManager.currentUser.age) {
                    self.registrationManager.nextScreen()
                }
                .tag(RegistrationManager.Screen.age)
                
                BioView(textEditor: self.$registrationManager.currentUser.bio) {
                    if self.registrationManager.hasValidBio() {
                        self.isShowingTerms.toggle()
                    }
                }
                .tag(RegistrationManager.Screen.bio)
            }
            .animation(.easeInOut, value: self.registrationManager.screenActive)
            .tabViewStyle(.page(indexDisplayMode: .never))
        }
        .overlay(alignment: .topLeading) {
            if self.isShowingPrevious {
                self.previousButton {
                    self.registrationManager.previousScreen()
                }
            }
        }
        .animation(.easeInOut, value: self.isShowingPrevious)
        .sheet(isPresented: self.$isShowingTerms) {
            TermsAgreementView {
                self.isRegistering = true
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    self.isRegistering = false
                    self.sessionManager.completeRegister()
                    self.sessionManager.signIn()
                }
            }
            .overlay {
                if self.isRegistering {
                    Color.black.opacity(0.4).ignoresSafeArea()
                    ProgressView()
                        .tint(.white)
                }
            }
            .interactiveDismissDisabled(self.isRegistering)
            .animation(.easeInOut, value: self.isRegistering)
        }
        .alert(
            isPresented: self.$registrationManager.hasError,
            error: self.registrationManager.error) { }
            .onAppear {
                ScrollViewEditor.disableScrollBehavior()
            }
            .onDisappear {
                ScrollViewEditor.enableScrollBehavior()
            }
            .onChange(of: self.registrationManager.screenActive, perform: { newValue in
                let oldValue = RegistrationManager.Screen.allCases.first ?? .username
                self.isShowingPrevious = newValue == oldValue ? false : true
            })
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
            .environmentObject(SessionManager())
    }
}

private extension SignUpView {
    @ViewBuilder
    private func previousButton(action: (@escaping () -> Void) = {}) -> some View {
        Button(action: action) {
            Image(systemName: "chevron.backward")
                .symbolVariant(.circle.fill)
                .foregroundColor(.white)
                .font(.system(size: 35,
                              weight: .bold,
                              design: .rounded))
                .padding()
        }
    }
}

