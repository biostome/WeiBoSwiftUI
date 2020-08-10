//
//  PostLiseView.swift
//  WeiBo
//
//  Created by leishen on 2020/8/1.
//  Copyright © 2020 YB. All rights reserved.
//

import SwiftUI

struct PostLiseView: View {
    var body: some View {
        List(postList.list){ item in
            PostCell(post: item)
            .listRowInsets(EdgeInsets())
        }.onAppear {
            UITableView.appearance().separatorStyle = .none
            UITableViewCell.appearance().selectionStyle = .none
        }
    }
}

struct PostLiseView_Previews: PreviewProvider {
    static var previews: some View {
        PostLiseView()
    }
}
