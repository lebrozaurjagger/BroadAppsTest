//
//  CustomTextField.swift
//  DotaDairy
//
//  Created by Phillip on 14.06.2024.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var text: String
    var placeholder: String
    var textColor: Color

    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(.lightMoreBlue)
            }
            TextField("", text: $text)
                .foregroundColor(textColor)
                .background(Color.clear)
        }
    }
}
