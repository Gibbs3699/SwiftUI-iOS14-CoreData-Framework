//
//  Successful.swift
//  ToDo-App&Widget
//
//  Created by admin on 9/1/2565 BE.
//

import SwiftUI

struct SuccessView: View {
    @State var show = false
    
    var body: some View {
        VStack {
            LottieView(name: "64963-topset-complete", loopMode: .loop)
                .frame(width: 110, height: 110, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .opacity(show ? 1 : 0)
//                .animation(Animation.easeIn(duration: 1).delay(0.4))
        }
        .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
        .onAppear{
            self.show = true
        }
    }
}

struct SuccessVIew_Previews: PreviewProvider {
    static var previews: some View {
        SuccessView()
    }
}
