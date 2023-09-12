import SwiftUI

struct BridgeStyleView: View {
    @State private var showingGame = false
    @State var b = 0
    @State var a = 0
    @State private var showingInfo = false
    @State private var showingWin = false
    @State private var showingDesign = false
    let infoCrane = ["Information on Machine","A bridge-style claw machine is an arcade game featuring a claw mechanism attached to a horizontal bridge that moves left and right. Players aim to position the claw over prizes and then lower it to grab them. These machines offer a variety of prizes and require both skill and luck to win. Operators can adjust the difficulty, and their popularity in arcades has led to some controversy regarding their fairness. Virtual versions are also available online and in mobile apps, replicating the gameplay of physical machines."]
    let winCrane = ["How to Win!","Pick Prizes Wisely: Choose ones closer to the prize drop and easily accessible.","Position the Claw Right: Move it accurately over your target prize."," Time Your Move: Lower the claw when it's directly over the prize and in a good position."," Be Patient: Crane machines are tough; practice and patience help."]
    // create array with name and then answer and then toggle switch between texts to show that when clicked it switches to answer
    // need home button then do same for rest.
    
    var body: some View {
        VStack{
            if showingInfo == false && showingWin == false && showingDesign == false && showingGame == false {
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
                    if b == 0 {
                        b = 1
                    }else{
                        b = 0
                    }
                    showingWin = true
                } label: {
                    ZStack {
                        Color(red: 0, green: 0.8, blue: 0.6)
                        Text(winCrane[0])
                            .font(.system(size: 40, design: .rounded))
                            .bold()
                            .foregroundColor(.black)
                            .font(.title)
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
        if showingInfo == true{
            ZStack{
                
                Color(red: 0, green: 0.8, blue: 0.6)
                Text(infoCrane[1])
                    .font(.system(size: 30, design: .rounded))
                    .foregroundColor(.black)
                    .padding()
                
            }
            .cornerRadius(20)
            .padding()
            .onTapGesture{
                showingInfo = false
            }
        }else if showingWin == true{
                    ZStack{

                        Color(red: 0, green: 0.8, blue: 0.6)
                        VStack{
                            Spacer()
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
                            Spacer()
                        }

                    }
                .padding()
                .onTapGesture{
                    showingWin = false
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

