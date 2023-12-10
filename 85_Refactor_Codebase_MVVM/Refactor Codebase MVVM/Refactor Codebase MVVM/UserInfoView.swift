//
//  UserInfoView.swift
//  Refactor Codebase MVVM
//
//  Created by Bambang Tri Rahmat Doni on 10/12/23.
//

import SwiftUI

struct UserInfoView: View {
    let user: User
    
    var body: some View {
        VStack {
            Text(user.name)
                .bold()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(.gray.opacity(0.1),
                    in: RoundedRectangle(
                        cornerRadius: 10.0,
                        style: .continuous
                    )
        )
    }
}

#Preview {
    UserInfoView(user: .empty)
}
