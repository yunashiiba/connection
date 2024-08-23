//
//  InvitedViewController.swift
//  connection
//
//  Created by 椎葉友渚 on 2024/08/23.
//

import UIKit
import MultipeerConnectivity

class InvitedViewController: UIViewController, MCNearbyServiceAdvertiserDelegate,MCSessionDelegate{
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        print("aaaa")
        print(peerID)
    }
    
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        print("aaaa")
        print(data)
    }
    
    func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        print("aaaa")
        print(peerID)
    }
    
    func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
        print("aaaa")
        print(peerID)
    }
    
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didReceiveInvitationFromPeer peerID: MCPeerID, withContext context: Data?, invitationHandler: @escaping (Bool, MCSession?) -> Void) {
        print("aaaa")
    }
    
    func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: (any Error)?) {
        print("aaaa")
        print(peerID)
    }
    
    //① MCNearbyServiceAdvertiserDelegateを生成する
    var advertiser : MCNearbyServiceAdvertiser!
    var session : MCSession!
    var peerID: MCPeerID!
    var serviceType = "SampleApp"
    override func viewDidLoad() {
        super.viewDidLoad()
        //②そのDelegate宣言をしてそのクラスを使えるようにする
        advertiser.delegate = self
        //advertiserを初期化
        advertiser = MCNearbyServiceAdvertiser(peer: peerID, discoveryInfo: nil, serviceType: serviceType)
        
        
        self.advertiser.startAdvertisingPeer()
    }
    
}


import Foundation

class DataCoder: NSObject, NSCoding {
    var studentID: Int!
    
    init( studentID : Int ) {
        self.studentID = studentID
    }
    
    // デコード
    required init?(coder aDecoder: NSCoder) {
        self.studentID = (aDecoder.decodeObject(forKey: "studentID") as! Int)
    }
    
    // エンコード
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.studentID, forKey: "studentID")
    }
    
}
