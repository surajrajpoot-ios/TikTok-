//
//  AuthViewModel.swift
//  TikTok
//
//  Created by surajkumar on 25/03/26.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import Combine
@MainActor
final class AuthViewModel: ObservableObject {
    let auth = Auth.auth()
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    @Published var isError: Bool = false
    let fireStore = Firestore.firestore()
    init(){
        Task{
            await loadCurrentUser()
        }
    }
    func loadCurrentUser() async{
        if let user = auth.currentUser{
            userSession = user
            await fetchUser(by: user.uid)
        }
    }
    func createUser(email: String,name:String, password: String) async{
        do{
            let authResult = try await auth.createUser(withEmail: email, password: password)
            await storeUserInFireStore(uid: authResult.user.uid, email: email, name: name)
        }
        catch{
       isError = true
        }
    }
    func storeUserInFireStore(uid:String,email:String,name:String) async{
        let user = User(uid: uid, email: email, name: name)
        do{
            try fireStore.collection("users").document(uid).setData(from:user)
        }
        catch{
            fatalError("teri meri yaari chhora sabne aave raas ki")
        }
        
    }
    func login(email:String,password:String) async{
        do{
            let authresult = try await auth.signIn(withEmail: email,password: password)
            userSession = authresult.user
            await fetchUser(by: authresult.user.uid)
           
        }
        catch{
      isError = true
        }
    }
    func fetchUser (by uid: String) async{
        do{
let document = try await fireStore.collection("users").document(uid).getDocument()
            currentUser = try document.data(as: User.self)
        }
        catch{
        isError = true
        }
    }
    func signOut(){
        do {
            userSession = nil
            currentUser = nil
            try auth.signOut()
        } catch{
            isError = true
        }
    }
    func deleteAccount() async{
        do{
           userSession = nil
            currentUser = nil
            deleteUser(by:auth.currentUser?.uid ?? "")
            try await auth.currentUser?.delete()
        }catch{
            
        }
    }
    func deleteUser(by uid:String){
        fireStore.collection("users").document(uid).delete()
    }
    func resetYourPassword(email:String) async{
        do{
            try await auth.sendPasswordReset(withEmail: email)
             
            }
        
        catch{
            isError = true
        }
    }
}

