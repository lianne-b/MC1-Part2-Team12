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
    /* 스와이프 애니메이션 때문에 diaryText 배열의 마지막 항목은 빈 값으로 넣어야 합니다 */
    let memberData: [DiaryData] = [
        DiaryData(
            id: 0,
            diaryName: "비니의 제목",
            memberName: "biny",
            diaryImage: "cc",
            diaryText: [
                "드디어 첫 팀플 시작함,,!!!!! 총 6명인데 다행히 같이 밥먹으면서 친해졌던 사람이 2명이나 있었음 휴,,, ",
                "다른 3명은 별로 안친하지만 다들 착해보이고 말도 잘통할 것 같아서 느낌스 갠춘함ㅎㅎ",
                ""
            ]
        ),
        
        DiaryData(
            id: 1,
            diaryName: "터피의 제목",
            memberName: "toughie",
            diaryImage: "lianneImage",
            diaryText: [
                "(오늘도 챌린지 주제 선정을 위해 팀원들과 열심히 논의 중!) 논의하면 팀원마다 생각이 달라서 의견 조율이 꽤 힘들더라구. ㅔ..? 화난 거 아닌데.. 고민하고 있었는데..🤔 ",
                "(집중하면 나도 모르게 나오는 표정이 있나 봐 ㅋㅋ..) 일단 프로틴 한 잔 마시고.. 웃는 연습을 좀 해야겠어. ",
                "인상 펴서 인생 피자 터피 ^__^ 나도 포커페이스 할 수 있다구..! (제일 못함)",
                ""
            ]
        ),
        
        DiaryData(
            id: 2,
            diaryName: "리앤의 제목",
            memberName: "lianne",
            diaryImage: "cc",
            diaryText: [
                "나는 오늘 팀원들과 '주체적인 생활'에 대해서 논의하다가 아이디어가 엎어진 게 기억에 남네. 주체적인 생활... 뭘까?ㅎ 이게 맞나? 아~ 다 모르겠고!",
                "기획을 엎는다는 건 참 지치고 힘든 일인 것 같아. 이럴 땐 꼭 당 보충을 해줘야 하는 거 알지.",
                "오늘은 집 가는 길에 반드시 브라우니를 사먹을거야!! 🥹",
                ""
            ]
        ),
        
        DiaryData(
            id: 3,
            diaryName: "미야의 제목",
            memberName: "miya",
            diaryImage: "lianneImage",
            diaryText: [
                "오늘 힘들었다.. 도라한테 피드백을 받았거든..... 틀린 건 아니지만~이라고 말하긴 했는데 틀린 것 같은 기분..^^ 나만 이런거 신경 쓰나?",
                "오늘도 회고하면서 정리 좀 하고 자야겠어. 머리 터지겠다!!!!!!!!!!!!!",
                ""
            ]
        ),
        
        DiaryData(
            id: 4,
            diaryName: "안나의 제목",
            memberName: "anna",
            diaryImage: "lianneImage",
            diaryText: [
                "챌린지 준비 재료를 사기위해 포항시내로 나왔어! 팀원들의 뛰어난 안목 덕분에 빠르게 쇼핑을 했는데 문구점에서 스티커를 고르는데 덩치 큰 터피가 춘식이 스티커를 보고 표정이 바뀌더라?!",
                "밤늦게까지 재료를 찾으면서 보람차다고 느꼈엉 끗!",
                ""
            ]
        ),
        
        DiaryData(
            id: 5,
            diaryName: "브루니의 제목",
            memberName: "bruny",
            diaryImage: "lianneImage",
            diaryText: [
                "오늘은 발표날! 많은 사람들앞에서 너무 떨린 나머지 발표를 잘 못해서 우울했다. 하지만 팀원들이 많이 다독여주어서 금방 회복하였다!",
                "다음에는 더 잘 열심히 준비해야지! 아자아자 화이팅! 👏",
                ""
            ]
        )
        
    ]
}
