//
//  PostDetailView.swift
//  WeiBoSwiftUI
//
//  Created by leishen on 2020/8/10.
//  Copyright © 2020 YB. All rights reserved.
//

import SwiftUI

struct PostDetailView: View {
    
    let post:Post
    
    var body: some View {
        List {
            PostCell(post: post).listRowInsets(.none)
            ForEach(1...10,id: \.self) { _ in
                Text("评论")
            }
        }.navigationBarTitle("详情", displayMode: .inline)
    }
}

struct PostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PostDetailView(post: postList.list[0])
    }
}
