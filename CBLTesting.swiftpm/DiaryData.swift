//
//  DiaryData.swift
//  CBLTesting
//
//  Created by Ye Eun Choi on 2023/03/29.
//

import Foundation

// MARK: - 일기 데이터를 담는 DiaryData 모델

struct DiaryData {
    var id: Int
    var memberName: String
    var diaryImage: String
    var diaryText: [String]
}
