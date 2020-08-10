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
    
    var postList: PostList {
        switch category {
        case .recommend:
            return loadPostListData("PostListData_recommend_1.json")
        case .hot:
            return loadPostListData("PostListData_hot_1.json")
        }
    }
    
    var body: some View {
        List(postList.list){ item in
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
    }
}
