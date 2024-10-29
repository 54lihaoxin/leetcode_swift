//
//  SolutionTests.swift
//  SolutionTests
//
//  Created by Haoxin Li on 10/13/24.
//  Copyright © 2024 Haoxin Li. All rights reserved.
//

/*

 127. Word Ladder
 Attempted
 Hard
 Topics
 Companies
 A transformation sequence from word beginWord to word endWord using a dictionary wordList is a sequence of words beginWord -> s1 -> s2 -> ... -> sk such that:

 Every adjacent pair of words differs by a single letter.
 Every si for 1 <= i <= k is in wordList. Note that beginWord does not need to be in wordList.
 sk == endWord
 Given two words, beginWord and endWord, and a dictionary wordList, return the number of words in the shortest transformation sequence from beginWord to endWord, or 0 if no such sequence exists.



 Example 1:

 Input: beginWord = "hit", endWord = "cog", wordList = ["hot","dot","dog","lot","log","cog"]
 Output: 5
 Explanation: One shortest transformation sequence is "hit" -> "hot" -> "dot" -> "dog" -> cog", which is 5 words long.
 Example 2:

 Input: beginWord = "hit", endWord = "cog", wordList = ["hot","dot","dog","lot","log"]
 Output: 0
 Explanation: The endWord "cog" is not in wordList, therefore there is no valid transformation sequence.


 Constraints:

 1 <= beginWord.length <= 10
 endWord.length == beginWord.length
 1 <= wordList.length <= 5000
 wordList[i].length == beginWord.length
 beginWord, endWord, and wordList[i] consist of lowercase English letters.
 beginWord != endWord
 All the words in wordList are unique.

 */

import XCTest

final class SolutionTests127: XCTestCase {
    func testSolution() throws {
        let solution = Solution()
        XCTAssertEqual(5, solution.ladderLength("hit", "cog", ["hot","dot","dog","lot","log","cog"]))
        XCTAssertEqual(0, solution.ladderLength("hit", "cog", ["hot","dot","dog","lot","log"]))
    }
}

fileprivate final class Solution {
    private var adjacentCache: [String: Set<String>] = [:]

    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        var wordLevels: [Set<String>] = [Set([beginWord])]
        var remainingWords: Set<String> = Set(wordList)
        if !remainingWords.contains(endWord) {
            return 0
        }

        while !remainingWords.isEmpty {
            var adjacentWords: Set<String> = []
            var nonadjacentWords: Set<String> = []
            let lastLevelWords = wordLevels.last ?? []

//            print("wordLevels: \(wordLevels)")
//            print("remainingWords: \(remainingWords)")

            for candidateWord in remainingWords {
                for lastLevelWord in lastLevelWords {
                    if isAdjacent(candidateWord, lastLevelWord) {
                        if candidateWord == endWord {
                            print("[a] levels: \(wordLevels.map { $0.count })")
                            return wordLevels.count + 1
                        } else {
                            adjacentWords.insert(candidateWord)
                            break
                        }
                    }
                }
                if !adjacentWords.contains(candidateWord) {
                    nonadjacentWords.insert(candidateWord)
                }
            }
            if adjacentWords.isEmpty {
                return 0
            } else {
                wordLevels.append(adjacentWords)
                remainingWords = nonadjacentWords
            }
        }
        print("[b] levels: \(wordLevels.map { $0.count })")
        return wordLevels.count
    }

    private func isAdjacent(_ a: String, _ b: String) -> Bool {
//        if let adjacents = adjacentCache[a], adjacents.contains(b) {
//            return true
//        }
//        if let adjacents = adjacentCache[b], adjacents.contains(a) {
//            return true
//        }

        var diffCount = 0
        for i in 0..<a.count {
            if a[i] != b[i] {
                diffCount += 1
            }
        }

        let isAdjacent = diffCount == 1
//        if isAdjacent {
//            if var cache = adjacentCache[a] {
//                cache.insert(b)
//                adjacentCache[a] = cache
//            } else {
//                adjacentCache[a] = [b]
//            }
//        }
        return isAdjacent
    }
}
