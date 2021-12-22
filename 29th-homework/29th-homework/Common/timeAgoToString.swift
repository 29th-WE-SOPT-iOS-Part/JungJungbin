//
//  timeAgoToString.swift
//  29th-homework
//
//  Created by 1v1 on 2021/12/22.
//

import Foundation

func timeAgoToString(secDouble: Double) -> String {
    // 몇 시간 전, 몇 분 전, 몇 초 전의 형식으로 return
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    dateFormatter.locale = NSLocale(localeIdentifier: "ko_KR") as Locale
    let current = Int(Date().timeIntervalSince1970)
    let getTime = secDouble
    let displaySec = current - Int(getTime)
    let displayMin = displaySec / 60
    let displayHour = displayMin / 60
    let displayDay = displayHour / 24
    let displayWeek = displayDay / 7
    let displayMonth = displayWeek / 4

    if displayMonth >= 1 {
        return "\(displayMonth)달 전"
    } else if displayWeek >= 1 {
        return "\(displayWeek)주 전"
    } else if displayDay >= 1 {
        return "\(displayDay)일 전"
    } else if displayHour >= 1 {
        return "\(displayHour)시간 전"
    } else if displayMin >= 1 {
        return "\(displayMin)분 전"
    } else {
        return "\(displaySec)초 전"
    }
}
