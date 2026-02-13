//
//  P287_Marquee.swift
//  FabulaItemsProvider
//
//  Infinite horizontal scrolling text ticker.
//

import SwiftUI

public struct P287_Marquee: View {

    @State private var t: CGFloat = 0
    private let text = " Fabula — SwiftUI examples "
    private let blockWidth: CGFloat = 350
    
    public init() {}
    
    public var body: some View {
        ZStack {
            Color.fabulaBack1
                .ignoresSafeArea()
            
            GeometryReader { geo in
                let w = geo.size.width
                HStack(spacing: 60) {
                    Text(text)
                        .font(.system(size: 24, weight: .medium))
                        .foregroundColor(Color.fabulaPrimary)
                    Text(text)
                        .font(.system(size: 24, weight: .medium))
                        .foregroundColor(Color.fabulaPrimary)
                }
                .frame(width: blockWidth * 2, alignment: .leading)
                .offset(x: w / 2 - blockWidth / 2 - t * blockWidth)
                .onAppear {
                    withAnimation(.linear(duration: 10).repeatForever(autoreverses: false)) {
                        t = 1
                    }
                }
            }
            .frame(height: 60)
            .clipped()
        }
    }
}

struct P287_Marquee_Previews: PreviewProvider {
    static var previews: some View {
        P287_Marquee()
    }
}
