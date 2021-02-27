//
//  ViewController.swift
//  TerraceHouse
//
//  Created by Alvin Tu on 5/30/20.
//  Copyright © 2020 Alvin Tu. All rights reserved.
//

import UIKit
import Lottie

class HouseMembersViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{
    var members:[HouseMember] = []
    var memberViewModels:[HouseMemberViewModel] = []
    
    @IBOutlet var tableView: UITableView!
    
//    private var animationView: AnimationView?


    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "MemberTableViewCell", bundle: nil), forCellReuseIdentifier: "MemberCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 150.0

        tableView.delegate = self
        tableView.dataSource = self
//        setUpAnimation()
        fetchData()
    }
    
    func setUpAnimation() {
        //lottie does not work - crash when initialized in newest xCode
//        animationView.animation = Animation.named("map")
//        animationView.frame = view.bounds
//        animationView?.backgroundColor = .white
//        animationView?.contentMode = .scaleAspectFit
//        animationView?.loopMode = .loop
//        animation.play()
//        view.addSubview(animationView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memberViewModels.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:"MemberCell", for: indexPath) as? MemberTableViewCell else { return UITableViewCell()}
//        let member = members[indexPath.row]
        let memberViewModel = memberViewModels[indexPath.row]
        cell.memberViewModel = memberViewModel
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected")
        tableView.deselectRow(at: indexPath, animated: true)
        
        let memberViewModel = memberViewModels[indexPath.row]
        let instagramHandle = memberViewModel.instagramLink
        guard let appURL = URL(string:  "instagram://user?username=\(instagramHandle)") else{return}
        guard let webURL = URL(string:  "https://instagram.com/\(instagramHandle)") else{return}

           if UIApplication.shared.canOpenURL(appURL) {
               if #available(iOS 10.0, *) {
                   UIApplication.shared.open(appURL, options: [:], completionHandler: nil)
               } else {
                   UIApplication.shared.openURL(appURL)
               }
           } else {
               //redirect to safari because the user doesn't have Instagram
               if #available(iOS 10.0, *) {
                   UIApplication.shared.open(webURL, options: [:], completionHandler: nil)
               } else {
                   UIApplication.shared.openURL(webURL)
               }
           }
        
    }
    fileprivate func fetchData() {
         Service.shared.fetchMembers { (members, err) in
             if let err = err {
                 print("Failed to fetch members:", err)
                 return
             }
             else{
                self.memberViewModels = members.map {return HouseMemberViewModel(member: $0)}
//                self.members = members
//                for member in self.members {
//                    let memberViewModel = HouseMemberViewModel(member: member)
//                    self.memberViewModels.append(memberViewModel)
//                }
                DispatchQueue.main.async{
                     self.tableView.reloadData()
                 }
             }
         }
     }

}

