//
//  Movie_AdviserApp.swift
//  Movie Adviser
//
//  Created by Can Özgür on 7.07.2024.
//

import SwiftUI
import Firebase
@main
struct Movie_AdviserApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @State private var showSignInView : Bool = false
    
    var body: some Scene {
        WindowGroup {
            ZStack{
                if !showSignInView {
                    TabBarView(showSignInView: $showSignInView)
                    
                    
                }
            }
            
            .onAppear{
                let authUser = try?AuthenticationManager.shared.getAuthenticationUser()
                print(showSignInView)
                self.showSignInView = (authUser == nil)
                print(showSignInView)
            }.fullScreenCover(isPresented: $showSignInView){
                SignInMainView(showSignInView: $showSignInView)

                //
            }
            
        }
        
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
            FirebaseApp.configure()
    return true
        
    }
}
