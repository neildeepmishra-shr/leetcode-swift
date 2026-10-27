//
//  392_Is_Subsequence.swift
//
//
//  Created by Neildeep Mishra on 27/10/26.
//
//
//
// Link: https://leetcode.com/problems/is-subsequence/
// Category: Two Pointers
//
// Complexity:
// - Time: O(T) where T is the length of string `t` (single linear scan)
// - Space: O(S + T) in Swift to convert `s` and `t` into `[Character]` arrays for O(1) indexing
//

class Solution {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        let sChar = Array(s)
        let tChar = Array(t)
        
        var sCharIndex = 0
        var tCharIndex = 0
        
        while sCharIndex < sChar.count && tCharIndex < tChar.count {
            if sChar[sCharIndex] == tChar[tCharIndex] {
                sCharIndex += 1
            }
            tCharIndex += 1
        }
        
        return sCharIndex == sChar.count
    }
}

/*
 // MARK: - Follow-Up Approach (Precomputed Hash Map + Binary Search for 10^9 Queries)
 // Pre-processes `t` once in O(T) time and space so each incoming `s` query runs in
 // O(S * log(T)) time without re-scanning `t`.
 
 class SubsequenceChecker {
     private var charIndices: [Character: [Int]] = [:]
     
     init(_ t: String) {
         for (index, char) in t.enumerated() {
             charIndices[char, default: []].append(index)
         }
     }
     
     func isSubsequence(_ s: String) -> Bool {
         var prevIndex = -1
         
         for char in s {
             guard let indices = charIndices[char] else {
                 return false
             }
             
             // Binary search for the smallest index in `indices` that is strictly greater than `prevIndex`
             var left = 0
             var right = indices.count - 1
             var nextMatchIndex = -1
             
             while left <= right {
                 let mid = left + (right - left) / 2
                 if indices[mid] > prevIndex {
                     nextMatchIndex = indices[mid]
                     right = mid - 1 // Keep searching left half for an even smaller valid index
                 } else {
                     left = mid + 1
                 }
             }
             
             if nextMatchIndex == -1 {
                 return false
             }
             prevIndex = nextMatchIndex
         }
         
         return true
     }
 }
 */
