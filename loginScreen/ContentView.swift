import SwiftUI

struct ContentView: View {
    
    // variables
    
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var loginScreen = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.red.ignoresSafeArea()
                
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scale(1.35)
                    .foregroundColor(.white)
                
                VStack {
                    Text("Login")
                        .font(.largeTitle)
                        .bold()
                    
                    TextField("Username", text: $username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongUsername))
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongPassword))
                        .padding(.bottom,20)
                    
                    Button("Login") {
                        AuthenticateUser(username: username, password: password)
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(.red.opacity(0.78))
                    .cornerRadius(10)
                    
                    NavigationLink(
                        destination: Text("You're logged In"),
                        isActive: $loginScreen){
                        EmptyView()
                    }
                }
            }
        }
        .navigationBarHidden(true)
    }
    
    func AuthenticateUser(username: String, password: String) {
        if username == "Yagnik" {
            wrongUsername = 0
            if password == "12345" {
                wrongPassword = 0
                loginScreen = true
            } else {
                wrongPassword = 2
            }
        } else {
            wrongUsername = 2
        }
    }
}

#Preview {
    ContentView()
}

