//
//  Successful.swift
//  ToDo-App&Widget
//
//  Created by admin on 9/1/2565 BE.
//

import SwiftUI

struct SuccessView: View {
    @State var show = true
    
    var body: some View {
        VStack {
            LottieView(name: "64963-topset-complete", loopMode: .loop)
                .frame(width: 100, height: 100)
                .opacity(show ? 1 : 0)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
                .onAppear{
                    self.show = true
            }
        }
        .animation(.easeInOut(duration: 0.5))
    }
}

struct SuccessVIew_Previews: PreviewProvider {
    static var previews: some View {
        SuccessView()
    }
}
