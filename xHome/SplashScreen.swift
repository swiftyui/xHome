import SwiftUI

struct SplashScreen: View {
    static var shouldAnimate = true

    var body: some View {
        ZStack {
            Rectangle().fill(Color.red)
            Text("XHome")
                .font(.largeTitle)
                .foregroundColor(.white)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#if DEBUG
    struct SplashScreen_Previews: PreviewProvider {
        static var previews: some View {
            SplashScreen()
        }
    }
#endif
