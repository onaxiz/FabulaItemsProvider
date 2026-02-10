//
//  P287_EtherealGlow.swift
//  FabulaItemsProvider
//
//  Soft ethereal glows for background
//

import SwiftUI

public struct P287_EtherealGlow: View {
    
    public init() {}
    
    public var body: some View {
        ZStack {
            Color.fabulaBack0
                .ignoresSafeArea()
            
            EtherealGlowView()
        }
    }
}

fileprivate struct EtherealGlowView: View {
    
    @State private var phase: CGFloat = 0
    @State private var phase2: CGFloat = 0
    @State private var phase3: CGFloat = 0
    @State private var phase4: CGFloat = 0
    @State private var phase5: CGFloat = 0
    
    var body: some View {
        GeometryReader { geometry in
            let w = geometry.size.width
            let h = geometry.size.height
            
            ZStack {
                GlowOrb(
                    phase: phase,
                    scalePhase: phase * 0.5,
                    baseX: w * 0.25,
                    baseY: h * 0.35,
                    size: w * 0.9,
                    color: Color.fabulaSecondary,
                    drift: 0.18
                )
                
                GlowOrb(
                    phase: phase2,
                    scalePhase: phase2 * 0.6,
                    baseX: w * 0.7,
                    baseY: h * 0.45,
                    size: w * 0.75,
                    color: Color.fabulaPrimary,
                    drift: 0.15
                )
                
                GlowOrb(
                    phase: phase3,
                    scalePhase: phase3 * 0.4,
                    baseX: w * 0.5,
                    baseY: h * 0.55,
                    size: w * 0.7,
                    color: Color.fabulaSecondary,
                    drift: 0.2
                )
                
                GlowOrb(
                    phase: phase4,
                    scalePhase: phase4 * 0.55,
                    baseX: w * 0.35,
                    baseY: h * 0.5,
                    size: w * 0.5,
                    color: Color.fabulaPrimary.opacity(0.8),
                    drift: 0.22
                )
                
                GlowOrb(
                    phase: phase5,
                    scalePhase: phase5 * 0.45,
                    baseX: w * 0.65,
                    baseY: h * 0.4,
                    size: w * 0.55,
                    color: Color.fabulaSecondary.opacity(0.8),
                    drift: 0.16
                )
            }
            .blendMode(.screen)
            .blur(radius: 40)
            .onAppear {
                withAnimation(.easeInOut(duration: 6).repeatForever(autoreverses: true)) {
                    phase = .pi * 2
                }
                withAnimation(.easeInOut(duration: 7).repeatForever(autoreverses: true).delay(0.3)) {
                    phase2 = .pi * 2
                }
                withAnimation(.easeInOut(duration: 5.5).repeatForever(autoreverses: true).delay(0.6)) {
                    phase3 = .pi * 2
                }
                withAnimation(.easeInOut(duration: 6.5).repeatForever(autoreverses: true).delay(1)) {
                    phase4 = .pi * 2
                }
                withAnimation(.easeInOut(duration: 7.5).repeatForever(autoreverses: true).delay(1.3)) {
                    phase5 = .pi * 2
                }
            }
        }
    }
}

fileprivate struct GlowOrb: View {
    var phase: CGFloat
    var scalePhase: CGFloat
    let baseX: CGFloat
    let baseY: CGFloat
    let size: CGFloat
    let color: Color
    let drift: CGFloat
    
    var body: some View {
        Ellipse()
            .fill(
                RadialGradient(
                    colors: [
                        color.opacity(0.6),
                        color.opacity(0.3),
                        color.opacity(0.1),
                        color.opacity(0)
                    ],
                    center: .center,
                    startRadius: 0,
                    endRadius: size * 0.55
                )
            )
            .frame(width: size, height: size * 1.5)
            .scaleEffect(0.85 + 0.15 * sin(scalePhase))
            .offset(
                x: cos(phase) * size * drift,
                y: sin(phase * 0.7) * size * drift
            )
            .position(x: baseX, y: baseY)
    }
}

struct P287_EtherealGlow_Previews: PreviewProvider {
    static var previews: some View {
        P287_EtherealGlow()
            .preferredColorScheme(.dark)
    }
}
