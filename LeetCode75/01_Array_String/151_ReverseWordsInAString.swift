//
//  151_ReverseWordsInAString.swift
//  
//
//  Created by Neildeep Mishra on 20/10/26.
//
// Link: https://leetcode.com/problems/reverse-words-in-a-string/
// Category: Array / String (Two Pointers)
//
// Complexity:
// - Time: O(N) where N is the length of the string
// - Space: O(N) to store the resulting string / character array
//

class Solution {
    func reverseWords(_ s: String) -> String {
        // Idiomatic Swift Standard Library approach:
        // 1. `split(separator: " ")` splits by space and automatically omits empty subsequences (extra spaces).
        //    It returns `[Substring]`, which avoids copying memory until `joined` is called.
        // 2. `reversed()` creates a lazy reversed view in O(1) time without allocating a new array.
        // 3. `joined(separator: " ")` concatenates the substrings into the final String in O(N) time.
        return s.split(separator: " ")
                .reversed()
                .joined(separator: " ")
    }
}

/*
 // MARK: - Alternative Approach 1: Manual Two-Pointer Scan from Right to Left
 // Use this in interviews when asked not to use built-in `.split()` or `.reversed()`.
 
 class Solution {
     func reverseWords(_ s: String) -> String {
         let chars = Array(s)
         var result = ""
         result.reserveCapacity(chars.count)
         
         var i = chars.count - 1
         
         while i >= 0 {
             // 1. Skip trailing or intermediate spaces
             while i >= 0 && chars[i] == " " {
                 i -= 1
             }
             
             if i < 0 { break }
             
             // 2. Mark the end of the current word
             let end = i
             
             // 3. Move left until the beginning of the word is found
             while i >= 0 && chars[i] != " " {
                 i -= 1
             }
             
             // 4. Add a single space separator if result already has words
             if !result.isEmpty {
                 result.append(" ")
             }
             
             // 5. Append the word slice `(i + 1)...end`
             result.append(contentsOf: chars[(i + 1)...end])
         }
         
         return result
     }
 }
 */

/*
 // MARK: - Alternative Approach 2: In-Place Character Array Manipulation (Follow-up)
 // Answers the follow-up question: O(1) auxiliary space on a mutable Character buffer
 // by compacting spaces, reversing the entire buffer, and reversing each word in place.
 
 class Solution {
     func reverseWords(_ s: String) -> String {
         var chars = Array(s)
         let n = chars.count
         
         // Step 1: Compact extra spaces in-place using read/write pointers
         var write = 0
         var read = 0
         
         while read < n {
             while read < n && chars[read] == " " { read += 1 }
             if read == n { break }
             
             if write > 0 {
                 chars[write] = " "
                 write += 1
             }
             
             while read < n && chars[read] != " " {
                 chars[write] = chars[read]
                 write += 1
                 read += 1
             }
         }
         
         // Trim the unused tail of the array
         chars.removeLast(n - write)
         
         // Step 2: Reverse the entire compacted character array
         reverse(&chars, 0, chars.count - 1)
         
         // Step 3: Reverse each individual word back to its proper letter order
         var start = 0
         for end in 0...chars.count {
             if end == chars.count || chars[end] == " " {
                 reverse(&chars, start, end - 1)
                 start = end + 1
             }
         }
         
         return String(chars)
     }
     
     private func reverse(_ chars: inout [Character], _ left: Int, _ right: Int) {
         var l = left
         var r = right
         while l < r {
             chars.swapAt(l, r)
             l += 1
             r -= 1
         }
     }
 }
 */
