//
//  443_StringCompression.swift
//  
//
//  Created by Neildeep Mishra on 22/10/26.
//
//
// Link: https://leetcode.com/problems/string-compression/
// Category: Array / String (Two Pointers - Read / Write)
//
// Complexity:
// - Time: O(N) where N is the length of chars (each character is read once)
// - Space: O(1) auxiliary space (in-place modification of input array)
//

class Solution {
    func compress(_ chars: inout [Character]) -> Int {
        let n = chars.count
        var read = 0
        var write = 0
        
        while read < n {
            let currentChar = chars[read]
            let groupStart = read
            
            // 1. Advance `read` past all consecutive occurrences of `currentChar`
            while read < n && chars[read] == currentChar {
                read += 1
            }
            
            // 2. Write the character at the `write` position
            chars[write] = currentChar
            write += 1
            
            // 3. Calculate streak length using pointer distance and write digits if > 1
            let count = read - groupStart
            if count > 1 {
                for digit in String(count) {
                    chars[write] = digit
                    write += 1
                }
            }
        }
        
        return write
    }
}

/*
 // MARK: - Alternative Approach (Look-Ahead with Explicit Counter)
 // Uses `count = 1` and peeks at `read + 1` to count consecutive duplicates.
 
 class Solution {
     func compress(_ chars: inout [Character]) -> Int {
         var read = 0
         var write = 0
         
         while read < chars.count {
             let currentChar = chars[read]
             var count = 1
             
             while read + 1 < chars.count && chars[read + 1] == currentChar {
                 read += 1
                 count += 1
             }
             read += 1
             
             chars[write] = currentChar
             write += 1
             
             if count > 1 {
                 let countString = String(count)
                 for digit in countString {
                     chars[write] = digit
                     write += 1
                 }
             }
         }
         
         return write
     }
 }
 */
