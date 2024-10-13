//
//  Challenge_70.swift
//  LeetCodeSolutions
//
//  Created by Haoxin Li on 11/7/22.
//  Copyright © 2022 Haoxin Li. All rights reserved.
//

import Foundation

/*

 362. Design Hit Counter
 Medium
 Topics
 Companies
 Design a hit counter which counts the number of hits received in the past 5 minutes (i.e., the past 300 seconds).

 Your system should accept a timestamp parameter (in seconds granularity), and you may assume that calls are being made to the system in chronological order (i.e., timestamp is monotonically increasing). Several hits may arrive roughly at the same time.

 Implement the HitCounter class:

 HitCounter() Initializes the object of the hit counter system.
 void hit(int timestamp) Records a hit that happened at timestamp (in seconds). Several hits may happen at the same timestamp.
 int getHits(int timestamp) Returns the number of hits in the past 5 minutes from timestamp (i.e., the past 300 seconds).


 Example 1:

 Input
 ["HitCounter", "hit", "hit", "hit", "getHits", "hit", "getHits", "getHits"]
 [[], [1], [2], [3], [4], [300], [300], [301]]
 Output
 [null, null, null, null, 3, null, 4, 3]

 Explanation
 HitCounter hitCounter = new HitCounter();
 hitCounter.hit(1);       // hit at timestamp 1.
 hitCounter.hit(2);       // hit at timestamp 2.
 hitCounter.hit(3);       // hit at timestamp 3.
 hitCounter.getHits(4);   // get hits at timestamp 4, return 3.
 hitCounter.hit(300);     // hit at timestamp 300.
 hitCounter.getHits(300); // get hits at timestamp 300, return 4.
 hitCounter.getHits(301); // get hits at timestamp 301, return 3.


 Constraints:

 1 <= timestamp <= 2 * 109
 All the calls are being made to the system in chronological order (i.e., timestamp is monotonically increasing).
 At most 300 calls will be made to hit and getHits.

 */

import Foundation

enum Challenge_362: Challenge {

    static let name = "Challenge 362"

    static func runTests() {
        let hitCounter = HitCounter()
        hitCounter.hit(1);       // hit at timestamp 1.
        hitCounter.hit(2);       // hit at timestamp 2.
        hitCounter.hit(3);       // hit at timestamp 3.
        guard 3 == hitCounter.getHits(4) else { fatalError() } // get hits at timestamp 4, return 3.
        hitCounter.hit(300);     // hit at timestamp 300.
        guard 4 == hitCounter.getHits(300) else { fatalError() } // get hits at timestamp 300, return 4.
        guard 3 == hitCounter.getHits(301) else { fatalError() } // get hits at timestamp 301, return 3.
    }
}

/**
 * Your HitCounter object will be instantiated and called as such:
 * let obj = HitCounter()
 * obj.hit(timestamp)
 * let ret_2: Int = obj.getHits(timestamp)
 */
fileprivate final class HitCounter {
    private class HitRecordNode {
        let timestamp: Int
        var earlierNode: HitRecordNode?

        init(timestamp: Int) {
            self.timestamp = timestamp
        }
    }

    private var mostRecentHitRecord: HitRecordNode?

    init() {}

    func hit(_ timestamp: Int) {
        if let mostRecentHitRecord = mostRecentHitRecord {
            if timestamp - mostRecentHitRecord.timestamp >= 300 {
                self.mostRecentHitRecord = .init(timestamp: timestamp) // drop the expired records
            } else {
                let node = HitRecordNode(timestamp: timestamp)
                node.earlierNode = mostRecentHitRecord
                self.mostRecentHitRecord = node
            }
        } else {
            self.mostRecentHitRecord = .init(timestamp: timestamp)
        }
    }

    func getHits(_ timestamp: Int) -> Int {
        var hitCount = 0
        var currentNode = mostRecentHitRecord

        while let node = currentNode {
            if timestamp - node.timestamp >= 300 {
                node.earlierNode = nil // drop the expired records
            } else {
                hitCount += 1
            }
            currentNode = node.earlierNode
        }

        return hitCount
    }
}
