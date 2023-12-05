//
//  UserInfoView.swift
//  Custom Data Models
//
//  Created by Bambang Tri Rahmat Doni on 05/12/23.
//

import SwiftUI

struct UserInfoView: View {
    @Binding var user: User
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    self.displayInfoView()
                    self.statusCountView()
                }
                
                Spacer()
                self.interactionsView {
                    self.user.interactions.incrementLike()
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.gray.opacity(0.1), in: RoundedRectangle(cornerRadius: 10, style: .continuous))
    }
}

#Preview {
    UserInfoView(user: .constant(User.existingData.first!))
}

private extension UserInfoView {
    @ViewBuilder
    private func displayInfoView() -> some View {
        HStack(alignment: .top) {
            Text(self.user.displayInfo.displayName.prefix(1))
                .foregroundStyle(.white)
                .font(.system(size: 18, weight: .heavy, design: .rounded))
                .padding()
                .background(self.user.displayInfo.color, in: Circle())
            VStack(alignment: .leading) {
                Text(self.user.displayInfo.displayName)
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                Text(self.user.displayInfo.username)
                    .font(.footnote)
            }
        }
    }
    
    @ViewBuilder
    private func statusCountView() -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Following")
                    .font(.system(size: 11, weight: .heavy, design: .rounded))
                Text(self.user.statusCount.following.description)
                    .font(.system(size: 10, weight: .light, design: .rounded))
                    .foregroundStyle(.gray)
            }
            
            VStack(alignment: .leading) {
                Text("Followers")
                    .font(.system(size: 11, weight: .heavy, design: .rounded))
                Text(self.user.statusCount.followers.description)
                    .font(.system(size: 10, weight: .light, design: .rounded))
                    .foregroundStyle(.gray)
            }
        }
    }
    
    @ViewBuilder
    private func interactionsView(action: (@escaping () -> Void) = {}) -> some View {
        VStack {
            Button {
                withAnimation {
                    action()
                }
            } label: {
                Image(systemName: "heart")
                    .symbolVariant(.fill)
                    .symbolRenderingMode(.multicolor)
                    .font(.system(size: 30, weight: .heavy, design: .rounded))
                
            }
            Text(self.user.interactions.numOfLikes.description)
                .font(.system(size: 10, weight: .light, design: .rounded))
            
        }
    }
}
