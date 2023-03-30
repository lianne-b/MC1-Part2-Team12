//
//  File.swift
//  
//
//  Created by Ye Eun Choi on 2023/03/30.
//

import Foundation

// MARK: - 싱글톤으로 데이터 분리
/* ex. DiaryViewModel.shared.memberData 처럼 접근 */

final class DiaryViewModel {
    static let shared = DiaryViewModel()
    private init() { }
    
    // MARK: - 팀원들의 다이어리 데이터
    let memberData: [DiaryData] = [
        DiaryData(
            id: 0,
            memberName: "biny",
            diaryImage: "cc",
            diaryText: [
                "대해서 논의하다가 아이디어가 엎어진 게 기억에 남네. 주체적인 생활... 뭘까?ㅎ 이게 맞나? 아~ 다 모르겠고!  기획을 엎는다는 건 참 지치고 힘든 일인 것 같아.",
                "Biny2",
                "Biny3"
            ]
        ),
        
        DiaryData(
            id: 1,
            memberName: "toughie",
            diaryImage: "lianneImage",
            diaryText: [
                "터피1비니 다음은 나야",
                "터피2",
                "터피3"
            ]
        ),
        
        DiaryData(
            id: 2,
            memberName: "lianne",
            diaryImage: "cc",
            diaryText: [
                "예우닝터피 다음은 나야",
                "키키",
                "케케"
            ]
        ),
        
        DiaryData(
            id: 3,
            memberName: "miya",
            diaryImage: "lianneImage",
            diaryText: [
                "리앤 다음은 나야",
                "크크",
                "코코"
            ]
        ),
        
        DiaryData(
            id: 4,
            memberName: "anna",
            diaryImage: "lianneImage",
            diaryText: [
                "미야 다음은 나야",
                "카카",
                "캬캬"
            ]
        ),
        
        DiaryData(
            id: 5,
            memberName: "bruny",
            diaryImage: "lianneImage",
            diaryText: [
                "마지막은 나야",
                "ㅇㅇ",
                "ㅇㅇ"
            ]
        )
        
    ]
}
