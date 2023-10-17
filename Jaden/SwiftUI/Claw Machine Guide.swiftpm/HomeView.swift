import SwiftUI

struct HomeView: View {
    @State private var showingCrane = false
    @State private var showingBridge = false
    var body: some View {
        VStack{
            if showingCrane == false && showingBridge == false{
                ZStack{
                    Color(red: 0, green: 0.8, blue: 0.6)
                    VStack{
                        Text("Claw Machines")
                            .font(.system(size: 80, design: .rounded))
                            .bold()
                            .foregroundColor(.black)
                            .font(.title)
                        Text("What are they? How do you win them and everything else? Click Below to Find Out!")
                            .font(.system(size: 40, design: .rounded))
                            .bold()
                            .foregroundColor(.black)
                            .font(.title)
                    }
                    
                }
                .cornerRadius(20)
                .padding()
                Image("image2")
                    .resizable()
                    .frame(width: 400, height: 400)
                Button() {
                    
                    showingCrane = true
                    
                } label: {
                    ZStack {
                        Color(red: 0, green: 0.8, blue: 0.6)
                        Text("Crane Machine")
                            .font(.system(size: 40, design: .rounded))
                            .bold()
                            .foregroundColor(.black)
                            .font(.title)
                    }
                    .cornerRadius(20)
                    .padding()
                    
                }
                Image("image1")
                    .resizable()
                    .frame(width: 400, height: 400)
                Button() {
                    showingBridge = true
                    
                } label: {
                    ZStack {
                        Color(red: 0, green: 0.8, blue: 0.6)
                        Text("Bridge Style Machine")
                            .font(.system(size: 40, design: .rounded))
                            .bold()
                            .foregroundColor(.black)
                            .font(.title)
                    }
                    .cornerRadius(20)
                    .padding()
                    
                }
               
            }
        }
        if showingCrane == true{
            ClawMachineView()
        }
        if showingBridge == true{
            BridgeStyleView()
        }
        
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
