//
//  Hero.swift
//  littlelemon
//
//  Created by Emre Ülkem on 29.04.2023.
//

import SwiftUI

struct Hero: View {
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text("Little Lemon")
                        .foregroundColor(Color.primaryColor2)
                        .font(.displayFont())
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("Chigago")
                        .foregroundColor(.white)
                        .font(.subTitleFont())
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer(minLength: 5)
                    Text()
                }
            }
        }
    }
}

struct Hero_Previews: PreviewProvider {
    static var previews: some View {
        Hero()
            .padding()
            .background(Color.primaryColor1)
            .frame(maxWidth: .infinity, maxHeight: 240)
    }
}
