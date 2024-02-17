//
//  File.swift
//  AiDiary
//
//  Created by usg on 2/18/24.
//

import SwiftUI

struct DiaryView: View {
    @EnvironmentObject var diaryManager: DiaryManager
    let selectedDate: Date
    
    var body: some View {
        // 선택된 날짜에 해당하는 일기를 표시합니다.
        List(diaryManager.entries.filter { $0.date == selectedDate }) { entry in
            Text(entry.content)
        }
    }
}

