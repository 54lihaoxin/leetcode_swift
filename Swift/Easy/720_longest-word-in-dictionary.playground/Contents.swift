/*
 
 720. Longest Word in Dictionary
 
 Given a list of strings words representing an English Dictionary, find the longest word in words that can be built one character at a time by other words in words. If there is more than one possible answer, return the longest word with the smallest lexicographical order.
 
 If there is no answer, return the empty string.
 Example 1:
 Input:
 words = ["w","wo","wor","worl", "world"]
 Output: "world"
 Explanation:
 The word "world" can be built one character at a time by "w", "wo", "wor", and "worl".
 Example 2:
 Input:
 words = ["a", "banana", "app", "appl", "ap", "apply", "apple"]
 Output: "apple"
 Explanation:
 Both "apply" and "apple" can be built from other words in the dictionary. However, "apple" is lexicographically smaller than "apply".
 Note:
 
 All the strings in the input will only contain lowercase letters.
 The length of words will be in the range [1, 1000].
 The length of words[i] will be in the range [1, 30].
 */

class TreeNode {
    let character: Character
    var children: [Character: TreeNode] = [:]
    var isLastCharacterInAWord = false
    var longestCharaterArray: [Character] {
        guard isLastCharacterInAWord else { return [] }
        let longestSoFar = children.values.reduce([] as [Character]) { (winner, node) in
            let candidate = node.longestCharaterArray
            if let winnerFirst = winner.first,
                let candidateFirst = candidate.first,
                winner.count == candidate.count {
                return winnerFirst < candidateFirst ? winner : candidate  // compare lexicographically
            } else {
                return winner.count > candidate.count ? winner : candidate
            }
        }
        return [character] + longestSoFar
    }
    var longestWord: String {
        return String(longestCharaterArray)
    }
    
    init?(word: String) {
        guard let first = word.first else { return nil }
        character = first
        let droppedFirst = word.dropFirst()
        buildTree(substring: droppedFirst)
    }
    
    /// same as `init?(word: String)`, but use `Substring` for input to avoid producing lots of strings
    init?(word: Substring) {
        guard let first = word.first else { return nil }
        character = first
        let droppedFirst = word.dropFirst()
        buildTree(substring: droppedFirst)
    }
    
    func buildTree(substring: Substring) {
        guard let first = substring.first else {
            isLastCharacterInAWord = true
            return
        }
        if let child = children[first] {
            child.buildTree(substring: substring.dropFirst())
        } else {
            children[first] = TreeNode(word: substring)
        }
    }
}

extension TreeNode: CustomStringConvertible {
    var description: String {
        return "[\(character)], isLast = \(isLastCharacterInAWord), children: \n\t\(children)"
    }
}

class Solution {
    func longestWord(_ words: [String]) -> String {
        var d: [Character: TreeNode] = [:]
        for w in words {
            guard let first = w.first else { continue }
            if let root = d[first] {
                root.buildTree(substring: w.dropFirst())
            } else {
                d[first] = TreeNode(word: w)
            }
        }
        
        let winner = d.values.reduce([] as [Character]) { (longest, root) in
            let candidate = root.longestCharaterArray
            if let longestFirst = longest.first,
                let candidateFirst = candidate.first,
                longest.count == candidate.count {
                return longestFirst < candidateFirst ? longest : candidate  // compare lexicographically
            } else {
                return longest.count > candidate.count ? longest : candidate
            }
        }
        return String(winner)
    }
}

let solution = Solution()
guard "world" == solution.longestWord(["w","wo","wor","worl", "world"]) else { fatalError() }
guard "apple" == solution.longestWord(["a", "banana", "app", "appl", "ap", "apply", "apple"]) else { fatalError() }

print("All tests passed")
