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
            diaryName: "팀원들과의 첫만남",
            memberName: "biny",
            diaryImage: "binyImage",
            diaryFont: "NanumDdoBagDdoBag",
            diaryStamp: "binyStamp",
            diaryText: [
                "드디어 첫 팀플 시작함,,!!!!! 총 6명인데 다행히 \n같이 밥먹으면서 친해졌던 사람이 2명이나 있었음 \n휴,,, 다른 3명은 별로 안친하지만 다들 착해보이고 \n말도 잘통할 것 같아서 느낌스 갠춘함ㅎㅎ",
                ""
            ]
        ),
        
        DiaryData(
            id: 1,
            diaryName: "인상 펴서 인생 피자",
            memberName: "toughie",
            diaryImage: "toughieImage",
            diaryFont: "NanumDongHwaDdoBag",
            diaryStamp: "toughieStamp",
            diaryText: [
                "(오늘도 챌린지 주제 선정을 위해 팀원들과 \n열심히 논의 중!) \n논의하면 팀원마다 생각이 달라서 의견 \n조율이 꽤 힘들더라구. ㅔ..? 화난 거 \n아닌데.. 고민하고 있었는데..",
                "(집중하면 나도 모르게 나오는 표정이 있나 \n봐 ㅋㅋ..) 일단 프로틴 한 잔 마시고.. 웃는 \n연습을 좀 해야겠어. 인상 펴서 인생 피자 \n터피 ^__^ 나도 포커페이스 할 수 있다구..! \n(제일 못함)",
                ""
            ]
        ),
        
        DiaryData(
            id: 2,
            diaryName: "당 떨어지는 날",
            memberName: "lianne",
            diaryImage: "lianneImage",
            diaryFont: "NanumDungGeunInYeon",
            diaryStamp: "lianneStamp",
            diaryText: [
                "나는 오늘 팀원들과 '주체적인 생활'에 대해서 \n논의하다가 아이디어가 엎어진 게 기억에 \n남네. 주체적인 생활... 뭘까?ㅎ 이게 맞나? \n아~ 다 모르겠고! 기획을 엎는다는 건 참 지치고 \n힘든 일인 것 같아.",
                "이럴 땐 꼭 당 보충을 해줘야 하는 거 알지. \n오늘은 집 가는 길에 반드시 브라우니를 \n사먹을거야!!",
                ""
            ]
        ),
        
        DiaryData(
            id: 3,
            diaryName: "복잡한 날",
            memberName: "miya",
            diaryImage: "miyaImage",
            diaryFont: "NanumGgocNaeEum",
            diaryStamp: "miyaStamp",
            diaryText: [
                "오늘 힘들었다.. 도라한테 피드백을 \n받았거든..... 틀린 건 아니지만~ \n이라고 말하긴 했는데 틀린 것 같은 \n기분..^^ 나만 이런거 신경 쓰나?",
                "오늘도 회고하면서 정리 좀 하고 \n자야겠어. \n머리 터지겠다!!!!!!!!!!!!!",
                ""
            ]
        ),
        
        DiaryData(
            id: 4,
            diaryName: "터피의 재발견",
            memberName: "anna",
            diaryImage: "annaImage",
            diaryFont: "NanumGyuRiEuiIrGi",
            diaryStamp: "annaStamp",
            diaryText: [
                "챌린지 준비 재료를 사기위해 포항시내로 \n나왔어! 팀원들의 뛰어난 안목 덕분에 \n빠르게 쇼핑을 했는데 문구점에서 스티커를 \n고르는데 덩치 큰 터피가 춘식이 스티커를 \n보고 표정이 바뀌더라?!",
                "밤늦게까지 재료를 찾으면서 보람차다고 \n느꼈엉. \n끗!",
                ""
            ]
        ),
        
        DiaryData(
            id: 5,
            diaryName: "발표가 좋아",
            memberName: "bruni",
            diaryImage: "bruniImage",
            diaryFont: "NanumMiNiSonGeurSsi",
            diaryStamp: "bruniStamp",
            diaryText: [
                "오늘은 발표날! 많은 사람들 앞에서 너무 \n떨린 나머지 발표를 잘 못해서 우울했다. \n하지만 팀원들이 많이 다독여주어서 금방 \n회복하였다! 다음에는 더 열심히 준비해야지! \n아자아자 화이팅!!!",
                ""
            ]
        )
        
    ]
}
