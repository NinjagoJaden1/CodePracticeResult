import SwiftUI

struct BridgeStyleView: View {
    @State private var showingGame = false
    @State var b = 0
    @State var a = 0
    let infoCrane = ["Information on Machine", "Crane games, also known as claw machines or claw cranes, are popular arcade games that involve players attempting to use a joystick-controlled crane to grab a prize, usually a stuffed animal or a small toy, and lift it out of a glass enclosure. These games have been a staple in arcades, amusement parks, and various entertainment venues for many years."]
    let winCrane = ["How to Win!","Choose Wisely: Pick prizes that are easy to grab and not buried under others." , "Watch and Learn: Observe others to understand how the claw works and how prizes react.", "Time It Right: Lower the claw when it's directly above the prize for the best chance.", "Practice and Be Patient: Learn from each try and stay patient."]
    // create array with name and then answer and then toggle switch between texts to show that when clicked it switches to answer
    // need home button then do same for rest.
    
    var body: some View {
        VStack{
            if showingGame == false {
                Button() {
                    
                    
                    
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
                Button() {
                    
                    if a == 0{
                        a = 1
                    }else if a == 1{
                        a = 0
                    }
                    
                } label: {
                    ZStack {
                        Color(red: 0, green: 0.8, blue: 0.6)
                        Text(infoCrane[a])
                            .font(.system(size: 40, design: .rounded))
                            .bold()
                            .foregroundColor(.black)
                            .font(.title)
                    }
                    .cornerRadius(20)
                    .padding()
                    
                }
                Button() {
                    
                    if b == 0{
                        b = 1
                    }else if b == 1{
                        b = 0
                    }
                    
                } label: {
                    ZStack {
                        Color(red: 0, green: 0.8, blue: 0.6)
                        if b == 0{
                            Text(winCrane[0])
                                .font(.system(size: 40, design: .rounded))
                                .bold()
                                .foregroundColor(.black)
                                .font(.title)
                        }else if b == 1{
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
                            .padding()
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
            }
        }
        if showingGame == true{
            BarGameView()
        }
        
    }
}

struct BridgeStyleView_Previews: PreviewProvider {
    static var previews: some View {
        BridgeStyleView()
    }
}

