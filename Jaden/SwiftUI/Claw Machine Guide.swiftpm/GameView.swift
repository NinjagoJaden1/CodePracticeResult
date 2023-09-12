import SwiftUI

struct GameView: View {
    @State private var showingbear = false
    @State var a = 0.5
    @State var b = 0
    @State var clawX : CGFloat = 0
    @State var clawY : CGFloat = 0
    @State var bearX : CGFloat = CGFloat.random(in: -100..<200)
    @State var bearY : CGFloat = 0
    @State var bunnyX : CGFloat = CGFloat.random(in: -100..<200)
    @State var bunnyY : CGFloat = 0
    @State var boneY : CGFloat = -30
    @State var boneX : CGFloat = 0
    @State var check  = false
    @State var hitBear = true
    @State var hitbunny = true
    @State var shots = 0
    @State var score = 0
    @State var time = 10
    @State var claw = "claw"
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var timeCheck = false
    func genPosition(){
        clawX = -190
        clawY = 0
    }
    var body: some View {
        if showingbear == false{
            VStack{
                HStack{
                    
                    Text("Tries: \(shots)")
                    Text("Prizes Obtained: \(score)")
                    Text("Time: \(time) Seconds")
                        .onReceive(timer) { _ in
                            if timeCheck == true {
                                time += 1
                            }else{
                                time = 0
                            }
                        }
                }
                ZStack(alignment: .bottom) {
                    Rectangle()
                        .fill(.blue)
                    Image("bar")
                        .resizable()
                        .frame(width: 100, height: 600)
                        .offset(x: -120, y: 236)
                        

                    Image("bear")
                        .resizable()
                        .frame(width: 70, height: 70)
                        .offset(x: bearX, y: bearY)
                    Image("bunny")
                        .resizable()
                        .frame(width: 70, height: 70)
                        .offset(x: bunnyX, y: bunnyY)

                    ZStack(alignment: .top){
                        Color.clear
                        Image(claw)
                            .resizable()
                            .frame(width: 100, height: 100)
                            .offset(x: clawX, y: clawY)
                            
                    }
                }
                .frame(width:450,height:700)
                .onAppear{
                    genPosition()
                }
                VStack{
                    HStack{
                        Button{
                            timeCheck = true
                            withAnimation(.easeInOut){
                                clawX -= 10
                                b += 15
                            }
                            
                        }label: {
                            Image(systemName: "arrowshape.turn.up.backward")
                                .foregroundColor(.primary)
                        }  
                        .keyboardShortcut("a",modifiers: [])
                        VStack{
                            Button("Attack"){
                                timeCheck = true
                                check = true
                                shots += 1
                                a = 0.5

                                withAnimation(.easeInOut(duration: 0.5)){
                                    clawY = 620
                                    
                                }
                                withAnimation(.easeInOut(duration: 0.5).delay(0.7)){
                                    if clawX >= bearX - 20 && clawX <= bearX + 20{
                                        hitBear = false 
                                        score += 1
                                    }                                
                                }
                                withAnimation(.easeInOut(duration: 0.0001).delay(1.2)){
                                    check = false
                                    boneY = -30
                                    if hitBear == false{
                                        a = 2.5
                                        withAnimation(.easeInOut(duration: 1.0)){
                                            claw = "claw"   
                                        }
                                       
                                        claw = "claw"
                                        withAnimation(.easeInOut(duration: 0.5).delay(1.0)){
                                            clawY = 0
                                            bearY = -620
                                            
                                        }
                                        withAnimation(.easeInOut(duration: 0.5).delay(1.5)){
                                            clawX = -200
                                            bearX = -200
                                        }
                                        withAnimation(.easeInOut(duration: 0.5).delay(2.0)){
                                            clawY = 620
                                            bearY = 0
                                        }
                                        
                                        
                                        
                                        
                                    }
                                    hitBear = true
                                }
                                withAnimation(.easeInOut(duration: 0.5).delay(0.7)){
                                    if clawX >= bunnyX - 20 && clawX <= bunnyX + 20{
                                        hitbunny = false 
                                        score += 1
                                    }                                
                                }
                                withAnimation(.easeInOut(duration: 0.0001).delay(1.2)){
                                    check = false
                                    boneY = -30
                                    if hitbunny == false{
                                        a = 2.5
                                        withAnimation(.easeInOut(duration: 1.0)){
                                            claw = "claw"   
                                        }
                                        
                                        claw = "claw"
                                        withAnimation(.easeInOut(duration: 0.5).delay(1.0)){
                                            clawY = 0
                                            bunnyY = -620
                                            print("hit")
//                                            claw = "closedclaw"
                                        }
                                        withAnimation(.easeInOut(duration: 0.5).delay(1.5)){
                                            clawX = -200
                                            bunnyX = -200
                                        }
                                        withAnimation(.easeInOut(duration: 0.5).delay(2.0)){
                                            clawY = 620
                                            bunnyY = 0
                                        }
                                        
                                        
                                        
                                        
                                    }
                                    hitbunny = true
                                }
                                withAnimation(.easeInOut(duration: 0.5).delay(a)){
                                    genPosition()
                                    bearX = CGFloat.random(in: -100..<200)
                                    bearY = 0
                                    bunnyX = CGFloat.random(in: -100..<200)
                                    bunnyY = 0
                                }

                            }.keyboardShortcut(.space, modifiers: [])
                            
                             
                            Button("Restart Game"){
                                genPosition()
                                bearX = CGFloat.random(in: -100..<200)
                                bearY = 0
                                bunnyX = CGFloat.random(in: -100..<200)
                                bunnyY = 0
                                check  = false
                                hitBear = true
                                shots = 0
                                score = 0
                                timeCheck = false
                                print(bunnyX)
                            }
                            
                        }
                        
                        
                        Button{
                            timeCheck = true
                            withAnimation(.easeInOut){
                                clawX += 10
                                print(clawX)
                            }
                        }label: {
                            Image(systemName: "arrowshape.turn.up.right")
                                .foregroundColor(.primary)
                        }
                        .keyboardShortcut("d",modifiers: [])
                        
                    }
                    Button() {
                        showingbear = true
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
        }
        if showingbear == true{
            HomeView()
        }
        
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
