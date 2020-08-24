//
//  PostLiseView.swift
//  WeiBo
//
//  Created by leishen on 2020/8/1.
//  Copyright © 2020 YB. All rights reserved.
//

import SwiftUI

struct PostLiseView: View {
    
    let category:PostListCategory
    
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        List(userData.postList(for: category).list){ item in
            ZStack {
                PostCell(post: item)
                NavigationLink(destination: PostDetailView(post: item)) {
                    EmptyView()
                }.hidden()
            }
        }.onAppear {
            UITableView.appearance().separatorStyle = .none
            UITableViewCell.appearance().selectionStyle = .none
        }
    }
}

struct PostLiseView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PostLiseView(category: .hot)
                .navigationBarTitle("微博", displayMode: .large)
        }
        .environmentObject(UserData())
    }
}
