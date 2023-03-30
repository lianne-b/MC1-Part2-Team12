//
//  DiaryData.swift
//  CBLTesting
//
//  Created by Ye Eun Choi on 2023/03/29.
//

import Foundation

// MARK: - 일기 데이터를 담는 DiaryData 모델

struct DiaryData {
    var id: Int // 아이디
    var memberName: String // 누구인지
    var diaryImage: String // 다이어리 이미지
    var diaryText: [String] // 다이어리 텍스트
    var mimoji : String // 미모지 그림
    var mimojiText : String // 미모지 텍스트
}
