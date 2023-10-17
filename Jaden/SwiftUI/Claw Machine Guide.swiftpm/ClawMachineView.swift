import SwiftUI

struct ClawMachineView: View {
    @State private var showingGame = false
     @State private var showingDesign = false
     @State private var showingInfo = false
     @State private var showingWin = false
         @State private var showingHome = false
    @State var b = 0
    @State var a = 0
    let infoCrane = ["Information on Machine", ]
    let winCrane = ["How to Win!","Choose Wisely: Pick prizes that are easy to grab and not buried under others." , "Watch and Learn: Observe others to understand how the claw works and how prizes react.", "Time It Right: Lower the claw when it's directly above the prize for the best chance.", "Practice and Be Patient: Learn from each try and stay patient."]
    // create array with name and then answer and then toggle switch between texts to show that when clicked it switches to answer
    // need home button then do same for rest.
    
    var body: some View {
        VStack{
            if showingGame == false && showingDesign == false && showingInfo == false && showingWin == false && showingHome == false{
                Button() {
                    
                    showingDesign = true
                    
                } label: {
                    ZStack {
                        Color(red: 0, green: 0.8, blue: 0.6)
                        Text("Design of Machine")
                            .font(.system(size: 40, design: .rounded))
                            .bold()
                            .foregroundColor(.black)
                            .font(.title)
                    }
                    .cornerRadius(20)
                    .padding()
                    
                }
                Image("image3")
                    .resizable()
                    .frame(width: 400, height: 400)
                Button() {

                    showingInfo = true
                    
                } label: {
                    ZStack {
                        Color(red: 0, green: 0.8, blue: 0.6)
                        Text(infoCrane[0])
                            .font(.system(size: 40, design: .rounded))
                            .bold()
                            .foregroundColor(.black)
                            .font(.title)
                    }
                    .cornerRadius(20)
                    .padding()
                    
                }
                Button() {
                    
                    showingWin = true
                    
                } label: {
                    ZStack {
                        Color(red: 0, green: 0.8, blue: 0.6)
                        VStack{
                            Text("How to Win!")
                                .font(.system(size: 40, design: .rounded))
                                .bold()
                                .foregroundColor(.black)
                                .font(.title)
                        }
                        
                        
                    }
                    .cornerRadius(20)
                    .padding()
                    
                }
                Button() {
                    
                    showingGame = true
                    
                } label: {
                    ZStack {
                        Color(red: 0, green: 0.8, blue: 0.6)
                        Text("Playable Game")
                            .font(.system(size: 40, design: .rounded))
                            .bold()
                            .foregroundColor(.black)
                            .font(.title)
                    }
                    .cornerRadius(20)
                    .padding()
                    
                }
                Button() {
                    
                    showingHome = true
                    
                } label: {
                    ZStack {
                        Color(red: 0, green: 0.8, blue: 0.6)
                        Text("Home")
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
        if showingGame == true{
            GameView()
        }
        if showingWin == true{
            Button() {
                
                showingWin = false
                
            } label: {
                ZStack{
                    Color(red: 0, green: 0.8, blue: 0.6)
                    VStack{
                        
                        
                        Text(winCrane[1])
                            .font(.system(size: 30, design: .rounded))
                            .bold()
                            .foregroundColor(.black)
                            .font(.title)  
                        Spacer()
                        Text(winCrane[2])
                            .font(.system(size: 30, design: .rounded))
                            .bold()
                            .foregroundColor(.black)
                            .font(.title)
                        Spacer()
                        Text(winCrane[3])
                            .font(.system(size: 30, design: .rounded))
                            .bold()
                            .foregroundColor(.black)
                            .font(.title)
                        Spacer()
                        Text(winCrane[4])
                            .font(.system(size: 30, design: .rounded))
                            .bold()
                            .foregroundColor(.black)
                            .font(.title)
                    }
                }
                
                
            }
        }
        if showingInfo == true{
            ZStack{
                
                Color(red: 0, green: 0.8, blue: 0.6)
                Text("Crane games, also known as claw machines or claw cranes, are popular arcade games that involve players attempting to use a joystick-controlled crane to grab a prize, usually a stuffed animal or a small toy, and lift it out of a glass enclosure. These games have been a staple in arcades, amusement parks, and various entertainment venues for many years.")
                    .font(.system(size: 30, design: .rounded))
                    .foregroundColor(.black)
                    .padding()
                
            }
            .cornerRadius(20)
            .padding()
            .onTapGesture{
                showingInfo = false
            }
            
        }
        if showingDesign == true{
            ZStack{
                
                Color(red: 0, green: 0.8, blue: 0.6)
                Image("design")
                
            }
            .cornerRadius(20)
            .padding()
            .onTapGesture{
                showingDesign = false
            }
        }
        if showingHome == true{
            HomeView()
        }
        
    }
}

struct ClawMachineView_Previews: PreviewProvider {
    static var previews: some View {
        ClawMachineView()
    }
}
