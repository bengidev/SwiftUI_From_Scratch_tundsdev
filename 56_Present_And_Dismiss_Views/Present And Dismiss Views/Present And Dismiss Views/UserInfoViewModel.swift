//
//  UserInfoViewModel.swift
//  Present And Dismiss Views
//
//  Created by Bambang Tri Rahmat Doni on 27/11/23.
//

import Foundation

final class UserInfoViewModel: ObservableObject {
    @Published private(set) var currentUser: UserInfo = .empty
    
    func editUserInfo(_ user: UserInfo) -> Void {
        self.currentUser = user
    }
    
    func editUserInfo(firstName: String) -> Void {
        self.currentUser = UserInfo(firstName: firstName,
                                    lastName: self.currentUser.lastName,
                                    gender: self.currentUser.gender)
    }
    
    func editUserInfo(lastName: String) -> Void {
        self.currentUser = UserInfo(firstName: self.currentUser.firstName,
                                    lastName: lastName,
                                    gender: self.currentUser.gender)
    }
    
    func editUserInfo(gender: UserInfo.Gender) -> Void {
        self.currentUser = UserInfo(firstName: self.currentUser.firstName,
                                    lastName: self.currentUser.lastName,
                                    gender: gender)
    }
}



