//
//  345_ReverseVowelsOfAString.swift
//  
//
//  Created by Neildeep Mishra on 17/10/26.
//
//
//
// Link: https://leetcode.com/problems/reverse-vowels-of-a-string/
// Category: Array / String (Two Pointers)
//
// Complexity:
// - Time: O(N) where N is the length of the string (each character is checked at most once)
// - Space: O(N) to convert the String into a mutable Character array
//

class Solution {
    // Allocated once per type rather than re-allocating on every function call
    private static let vowels: Set<Character> = [
        "a", "e", "i", "o", "u",
        "A", "E", "I", "O", "U"
    ]
    
    func reverseVowels(_ s: String) -> String {
        var chars = Array(s)
        var left = 0
        var right = chars.count - 1
        
        while left < right {
            // 1. Advance `left` until it points to a vowel
            while left < right && !Self.vowels.contains(chars[left]) {
                left += 1
            }
            
            // 2. Advance `right` backward until it points to a vowel
            while left < right && !Self.vowels.contains(chars[right]) {
                right -= 1
            }
            
            // 3. Both pointers are now guaranteed to be on vowels (or have met)
            if left < right {
                chars.swapAt(left, right)
                left += 1
                right -= 1
            }
        }
        
        return String(chars)
    }
}

/*
 // MARK: - Alternative Approach (Single Loop with If/Else)
 // Slightly more readable for beginners, but re-evaluates `vowels.contains`
 // on the waiting pointer while the other pointer skips consonants.
 
 class Solution {
     func reverseVowels(_ s: String) -> String {
         var chars = Array(s)
         let vowels: Set<Character> = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]
         
         var left = 0
         var right = chars.count - 1
         
         while left < right {
             let isLeftVowel = vowels.contains(chars[left])
             let isRightVowel = vowels.contains(chars[right])
             
             if isLeftVowel && isRightVowel {
                 chars.swapAt(left, right)
                 left += 1
                 right -= 1
             } else if !isLeftVowel {
                 left += 1
             } else {
                 right -= 1
             }
         }
         
         return String(chars)
     }
 }
 */
