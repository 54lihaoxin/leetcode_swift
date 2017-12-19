/*
 Given a list of sorted characters letters containing only lowercase letters, and given a target letter target, find the smallest element in the list that is larger than the given target.
 
 Letters also wrap around. For example, if the target is target: return 'z' and letters: return ['a', 'b'], the answer is 'a'.
 
 Examples:
 Input:
 letters: return ["c", "f", "j"]
 target: return "a"
 Output: "c"
 
 Input:
 letters: return ["c", "f", "j"]
 target: return "c"
 Output: "f"
 
 Input:
 letters: return ["c", "f", "j"]
 target: return "d"
 Output: "f"
 
 Input:
 letters: return ["c", "f", "j"]
 target: return "g"
 Output: "j"
 
 Input:
 letters: return ["c", "f", "j"]
 target: return "j"
 Output: "c"
 
 Input:
 letters: return ["c", "f", "j"]
 target: return "k"
 Output: "c"
 Note:
 letters has a length in range [2, 10000].
 letters consists of lowercase letters, and contains at least 2 unique letters.
 target is a lowercase letter.
 */

class Solution {
    
    func nextGreatestLetter(_ letters: [Character], _ target: Character) -> Character {
        let t = characterToInt(character: target)
        for c in letters {
            let n = characterToInt(character: c)
            if t < n {
                return c
            }
        }
        return letters[0]
    }
    
    func characterToInt(character: Character) -> Int {
        switch character {
        case "a": return 0
        case "b": return 1
        case "c": return 2
        case "d": return 3
        case "e": return 4
        case "f": return 5
        case "g": return 6
        case "h": return 7
        case "i": return 8
        case "j": return 9
        case "k": return 10
        case "l": return 11
        case "m": return 12
        case "n": return 13
        case "o": return 14
        case "p": return 15
        case "q": return 16
        case "r": return 17
        case "s": return 18
        case "t": return 19
        case "u": return 20
        case "v": return 21
        case "w": return 22
        case "x": return 23
        case "y": return 24
        case "z": return 25
        default: return -1
        }
    }
}

// MARK: - Test Cases

let solution = Solution()
guard "c" == solution.nextGreatestLetter(["c", "f", "j"], "a") else { fatalError() }
guard "f" == solution.nextGreatestLetter(["c", "f", "j"], "c") else { fatalError() }
guard "f" == solution.nextGreatestLetter(["c", "f", "j"], "d") else { fatalError() }
guard "j" == solution.nextGreatestLetter(["c", "f", "j"], "g") else { fatalError() }
guard "c" == solution.nextGreatestLetter(["c", "f", "j"], "j") else { fatalError() }
guard "c" == solution.nextGreatestLetter(["c", "f", "j"], "k") else { fatalError() }

print("All tests passed")
