//
//  matList.swift
//  matDuk
//
//  Created by 소프트웨어컴퓨터 on 2022/01/24.
//

import Foundation

struct SetMenu {
    let menu : String
    let menuImg : String
}

struct SetList {
    let name : String
    let ico : String
    var exp : String? = nil
    var img : String = ""
    var menus : [SetMenu] = [SetMenu(menu: "준비중", menuImg: "")]
    let phone : String
    let latitude : Double
    let longitude : Double
}

struct SetSection {
    let items: [SetList]
    let header: String
    
    static func matList() -> [SetSection] {
        return [
            // 한식
            SetSection(items: [
                SetList(name: "한솥도시락 인덕대앞점", ico: "han-main", img: "han-detail",
                        phone: "02-900-6110",
                        latitude: 37.6288866180, longitude: 127.056639003),
                SetList(name: "그남자의돼지갈비", ico: "he-main", exp: "돼지고기구이", img: "he-detail",
                        phone: "0507-1449-9978",
                        latitude: 37.6291458173, longitude: 127.0578020594)
            ], header: "한식"),
            // 일식
            SetSection(items: [
                SetList(name: "오늘은돈부리", ico: "don-main", exp: "덮밥", img: "don-detail",
                        phone: "02-999-6909",
                        latitude: 37.6318176696, longitude: 127.0584807570)
            ], header: "일식"),
            // 양식
            SetSection(items: [
                SetList(name: "벼락이네띵똥땡키친", ico: "byu-main", exp: "스파게티, 파스타 전문", img: "byu-detail",
                        phone: "02-998-6450",
                        latitude: 37.6310751070, longitude: 1270582851874)
            ], header: "양식"),
            // 치킨
            SetSection(items: [
                SetList(name: "호식이두마리치킨 월계1호점", ico: "ho-main", exp: "치킨, 닭강정", img: "ho-detail", menus: [
                            SetMenu(menu: "세트", menuImg: "ho-menu-1"),
                            SetMenu(menu: "단품", menuImg: "ho-menu-2"),
                            SetMenu(menu: "뼈한마리+뼈한마리+콜라1개", menuImg: "ho-menu-3"),
                            SetMenu(menu: "순살+순살+콜라1개", menuImg: "ho-menu-4")],
                        phone: "02-6010-9282",
                        latitude: 37.6313323238, longitude: 127.0577957525),
                SetList(name: "더블플레이치킨 인덕대점", ico: "dbl-main", exp: "치킨, 닭강정", img: "dbl-detail", menus: [
                            SetMenu(menu: "할라피뇨 체다치즈 순살", menuImg: "dbl-menu-1"),
                            SetMenu(menu: "땡초마늘 치킨", menuImg: "dbl-menu-2"),
                            SetMenu(menu: "파닭 순살", menuImg: "dbl-menu-3"),
                            SetMenu(menu: "궁물떡볶이(1.5인분)", menuImg: "dbl-menu-4")],
                        phone: "0507-1362-3758",
                        latitude: 37.6315663188, longitude: 127.0575049682)
            ], header: "치킨"),
            // 햄버거
            SetSection(items: [
                SetList(name: "오늘버거싶어", ico: "today-main", exp: "햄버거", img: "today-detail",
                        phone: "0507-1439-1197",
                        latitude: 37.6320896792, longitude: 127.0571687347)
            ], header: "햄버거"),
            // 카페
            SetSection(items: [
                SetList(name: "스타벅스 월계역점", ico: "st-main", img: "st-detail",
                        phone: "1522-3232",
                        latitude: 37.6298630213, longitude: 127.0581226424),
                SetList(name: "이디야월계인덕점", ico: "ed-main", img: "ed-detail",
                        phone: "02-914-7413",
                        latitude: 37.6297819100, longitude: 127.0588016281)
            ], header: "카페"),
            // 기타
            SetSection(items: [
                SetList(name: "샐러드조이", ico: "sj-main", exp: "다이어트, 샐러드", img: "sj-detail", menus: [
                        SetMenu(menu: "BASIC(기본)", menuImg: "sj-menu-1"),
                        SetMenu(menu: "RICOTTA(수제리코타치즈)", menuImg: "sj-menu-2"),
                        SetMenu(menu: "닭가슴살 샌드위치", menuImg: "sj-menu-3"),
                        SetMenu(menu: "단호박스프", menuImg: "sj-menu-4")],
                        phone: "0507-1326-7367",
                        latitude: 37.6311536291, longitude: 127.0581733852)
            ], header: "기타")
        ]
    }
}
