//
//  PostListCategory.swift
//  WeiBoSwiftUI
//
//  Created by leishen on 2020/8/10.
//  Copyright © 2020 YB. All rights reserved.
//

import SwiftUI

class UserData: ObservableObject {
    @Published var recommondPostList: PostList = loadPostListData("PostListData_recommend_1.json")
    @Published var hotPostList: PostList = loadPostListData("PostListData_hot_1.json")
    
    private var recommondPostDic: [Int: Int] = [:] // id: index
    private var hotPostDic: [Int: Int] = [:] // id: index
    
    init() {
        for i in 0..<recommondPostList.list.count {
            let post = recommondPostList.list[i]
            recommondPostDic[post.id] = i
        }
        for i in 0..<hotPostList.list.count {
            let post = hotPostList.list[i]
            hotPostDic[post.id] = i
        }
    }
    
    
}

enum PostListCategory {
    case recommend, hot
}

extension UserData {
    func postList(for category:PostListCategory) -> PostList {
        switch category {
        case .recommend:
            return recommondPostList
        case .hot:
            return hotPostList
        }
    }
    
    func post(forId id: Int) -> Post? {
        if let index = recommondPostDic[id] {
            return recommondPostList.list[index]
        }
        if let index = hotPostDic[id] {
            return hotPostList.list[index]
        }
        return nil
    }
    
    func update(_ post:Post) {
        if let index = recommondPostDic[post.id] {
            recommondPostList.list[index] = post
        }
        if let index = hotPostDic[post.id] {
            hotPostList.list[index] = post
        }
    }
    
}





