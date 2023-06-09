//
//  Theme.swift
//  activity-goal-tracker
//
//  Created by tucker bichsel on 07/06/2023.
//
import SwiftUI




enum ThemeName {
    case redTheme
    case darkTheme
}

enum Fonts{
    case headlineFont
    case subTitleFont
    case bodyFont
    case buttonFont
    case warningFont
}

func getFont(name:Fonts) -> Font{
    switch(name){
        case .headlineFont: return Font.custom("Arial", size: 30)
        case .subTitleFont: return Font.custom("Arial", size: 20)
        case .bodyFont: return Font.custom("Arial", size: 12)
        case .buttonFont: return Font.custom("Arial", size:16)
        case .warningFont: return Font.custom("Arial", size: 8)
    }
}


class Theme:ObservableObject {
    @Published var brandColor: Color
    @Published var backgroundColor: Color
    @Published var contrastBackgroundColor: Color
    @Published var secondaryColor: Color
    @Published var shadowColor: Color
    @Published var bodyTextColor: Color
    
    
    @Published var headlineFont:Font
    @Published var subTitleFont:Font
    @Published var bodyFont:Font
    @Published var buttonFont:Font
    @Published var warningFont:Font
    
    @Published var largeSpacing:CGFloat
    @Published var mediumSpacing:CGFloat
    @Published var smallSpacing:CGFloat
    
    init(brandColor:Color, backgroundColor:Color, contrastBackgroundColor:Color, secondaryColor:Color, shadowColor:Color, bodyTextColor:Color, headlineFont:Font, subTitleFont:Font, bodyFont:Font, buttonFont:Font, warningFont:Font, largeSpacing:CGFloat, mediumSpacing:CGFloat, smallSpacing:CGFloat){
        self.brandColor = brandColor
        self.backgroundColor = backgroundColor
        self.contrastBackgroundColor = contrastBackgroundColor
        self.secondaryColor = secondaryColor
        self.shadowColor = shadowColor
        self.bodyTextColor = bodyTextColor
        self.headlineFont = headlineFont
        self.subTitleFont = subTitleFont
        self.bodyFont = bodyFont
        self.buttonFont = buttonFont
        self.warningFont = warningFont
        self.largeSpacing = largeSpacing
        self.mediumSpacing = mediumSpacing
        self.smallSpacing = smallSpacing
        
    }
}

var themes: [Theme] = [
    //default
    Theme(brandColor: Color(hex: 0xD6E8DB),
          backgroundColor: Color(hex: 0xFFF8DE),
          contrastBackgroundColor: Color(hex: 0x99A98F),
          secondaryColor: Color(hex: 0x26ba2d),
          shadowColor: Color(hex: 0x336688),
          bodyTextColor: Color(hex: 0x27374D),
          
          headlineFont: getFont(name: .headlineFont),
          subTitleFont:getFont(name: .subTitleFont),
          bodyFont: getFont(name: .bodyFont),
          buttonFont: getFont(name: .buttonFont),
          warningFont: getFont(name: .warningFont),
          
          largeSpacing: 16.0,
          mediumSpacing: 12.0,
          smallSpacing: 4.0
         ),
          
    
    //redTheme
    Theme(brandColor: Color(hex: 0x89aa3d),
          backgroundColor: Color(hex:0xf5ec13),
          contrastBackgroundColor: Color(hex: 0xf2c233),
          secondaryColor: Color(hex: 0x4f2ba1),
          shadowColor: Color(hex: 0x336688),
          bodyTextColor: Color(hex: 0x55dcb2),
          
          headlineFont: getFont(name: .headlineFont),
          subTitleFont: getFont(name: .subTitleFont),
          bodyFont: getFont(name: .bodyFont),
          buttonFont: getFont(name: .buttonFont),
          warningFont: getFont(name: .warningFont),
          
          largeSpacing: 16.0,
          mediumSpacing: 6.0,
          smallSpacing: 4.0
         )
          
]

extension Color {
    init(hex: Int, opacity: Double = 1.0) {
        let red = Double((hex & 0xff0000) >> 16) / 255.0
        let green = Double((hex & 0xff00) >> 8) / 255.0
        let blue = Double((hex & 0xff) >> 0) / 255.0
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
    }
}
