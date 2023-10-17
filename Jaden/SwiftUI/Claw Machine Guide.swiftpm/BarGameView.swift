import SwiftUI

struct BarGameView: View {
    @State private var showingphone = false
    @State var a = 0.5
    @State var b = ["1","2","3"]
    @State var c = 0
    @State var clawX : CGFloat = -180
    @State var clawY : CGFloat = 0
    @State var phoneX : CGFloat = 0
    @State var phoneY : CGFloat = -370
    @State var bunnyX : CGFloat = CGFloat.random(in: -100..<200)
    @State var bunnyY : CGFloat = 0
    @State var boneY : CGFloat = -30
    @State var boneX : CGFloat = 0
    @State var check  = false
    @State var hitphone = true
    @State var hitbunny = true
    @State var shots = 0
    @State var score = 0
    @State var time = 10
    @State var claw = "claw"
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var timeCheck = false
    func genPosition(){
        clawX = -180
        clawY = 0
        c = 0
        phoneY = -370
    }
    var body: some View {
        if showingphone == false{
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
                        .fill(.gray)
                    VStack{
                        Spacer()
                        Image("bridge")
                            .resizable()
                            .frame(width: 450, height: 300)
                            .offset(x: 0, y: 120)
                        
                        Image("bridge")
                            .resizable()
                            .frame(width: 450, height: 300)
                            .offset(x: 0, y: -250) 
                            
                        Spacer()
                    }
                    Image(b[c])
                        .resizable()
                        .frame(width: 125, height: 125)
                        .offset(x: phoneX, y: phoneY)

                    ZStack(alignment: .top){
                        Color.clear
                        Image(claw)
                            .resizable()
                            .frame(width: 100, height: 100)
                            .offset(x: clawX, y: clawY)
                        
                    }
                }
                .frame(width:450,height:700)
//                .onAppear{
//                    genPosition()
//                }
                VStack{
                    HStack{
                        Button{
                            timeCheck = true
                            withAnimation(.easeInOut){
                                clawX -= 10
                                
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
                                    clawY = 250
                                }
                                withAnimation(.easeInOut(duration: 0.5).delay(0.7)){
                                    if clawX >= phoneX - 50 && clawX <= phoneX + 50{
                                        hitphone = false 
                                        
                                        
                                    }                                
                                }
                                withAnimation(.easeInOut(duration: 0.0001).delay(1.2)){
                                    check = false
                                    boneY = -30
                                    if hitphone == false{
                                        a = 1.0
                                        if c == 2{
                                            c = 0
                            
                                        }else{
                                            c+=1
                                        }
                                        withAnimation(.easeInOut(duration: 0.5)){
                                            claw = "claw"   
                                        }
                                        
                                        claw = "claw"
                                        withAnimation(.easeInOut(duration: 0.5).delay(0.5)){
                                            clawY = 0
                                        }

                                        withAnimation(.easeInOut(duration: 0.5).delay(2.0)){
                                            if c == 2{
                                                phoneY = 0
                                                    score += 1
                                            }
                                            
                                        }
                                        
                                        
                                        
                                        
                                    }
                                    hitphone = true
                                }
                        
                                withAnimation(.easeInOut(duration: 0.5).delay(a)){
                                    clawX = -180
                                    clawY = 0
                                }
//                                
                            }.keyboardShortcut(.space, modifiers: [])
                            
                            
                            Button("Restart Game"){
                                genPosition()

                                check  = false
                                hitphone = true
                                shots = 0
                                score = 0
                                timeCheck = false
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
                        showingphone = true
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
        if showingphone == true{
            HomeView()
        }
        
    }
}

struct BarGameView_Previews: PreviewProvider {
    static var previews: some View {
        BarGameView()
    }
}
