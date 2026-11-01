//
//  1456_Maximum_Numeber_of_Vowels_in_a_Substring_of_Given_Length.swift
//  
//
//  Created by Neildeep Mishra on 01/11/26.
//
//
// Link: https://leetcode.com/problems/maximum-number-of-vowels-in-a-substring-of-given-length/
// Category: Sliding Window (Fixed-Size Window)
//
// Complexity:
// - Time: O(N) where N is the length of string `s`
// - Space: O(N) to store the `[Character]` array for O(1) random access
//

class Solution {
    func maxVowels(_ s: String, _ k: Int) -> Int {
        let vowels: Set<Character> = ["a", "e", "i", "o", "u"]
        let sChars = Array(s)
        var currentVowels = 0
        
        // 1. Count vowels in the initial window of size `k` (indices 0 ..< k)
        for i in 0..<k {
            if vowels.contains(sChars[i]) {
                currentVowels += 1
            }
        }
        
        var maxVowels = currentVowels
        if maxVowels == k {
            return k
        }
        
        // 2. Slide the window across the rest of the string
        for i in k..<sChars.count {
            if vowels.contains(sChars[i]) {
                currentVowels += 1
            }
            if vowels.contains(sChars[i - k]) {
                currentVowels -= 1
            }
            
            maxVowels = max(maxVowels, currentVowels)
            
            // Early exit: a window of length `k` can never contain more than `k` vowels
            if maxVowels == k {
                return k
            }
        }
        
        return maxVowels
    }
}

/*
 // MARK: - Alternative Approach (Fast `switch` Helper Avoiding `Set` Hashing Overhead)
 // Replaces `Set<Character>.contains` with an inline `switch` statement, which compiles
 // down to direct byte comparisons without hash calculations.
 
 class Solution {
     private func isVowel(_ char: Character) -> Bool {
         switch char {
         case "a", "e", "i", "o", "u":
             return true
         default:
             return false
         }
     }
     
     func maxVowels(_ s: String, _ k: Int) -> Int {
         let sChars = Array(s)
         var currentVowels = 0
         
         for i in 0..<k {
             if isVowel(sChars[i]) {
                 currentVowels += 1
             }
         }
         
         var maxVowels = currentVowels
         if maxVowels == k { return k }
         
         for i in k..<sChars.count {
             if isVowel(sChars[i]) { currentVowels += 1 }
             if isVowel(sChars[i - k]) { currentVowels -= 1 }
             
             maxVowels = max(maxVowels, currentVowels)
             if maxVowels == k { return k }
         }
         
         return maxVowels
     }
 }
 */
