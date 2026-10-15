//
//  1768_MergeStringsAlternately.swift
//  
//
//  Created by Neildeep Mishra on 15/10/26.
//
// Link: https://leetcode.com/problems/merge-strings-alternately/
// Category: Array / String
//
// Complexity:
// - Time: O(M + N) where M and N are lengths of word1 and word2
// - Space: O(1) auxiliary space (excluding the output string)
//

class Solution {
    func mergeAlternately(_ word1: String, _ word2: String) -> String {
        var result = ""
        result.reserveCapacity(word1.count + word2.count)
        
        var i = word1.startIndex
        var j = word2.startIndex
        
        while i < word1.endIndex && j < word2.endIndex {
            result.append(word1[i])
            result.append(word2[j])
            word1.formIndex(after: &i)
            word2.formIndex(after: &j)
        }
        
        // Append whatever remains from either string
        if i < word1.endIndex {
            result.append(contentsOf: word1[i...])
        }
        if j < word2.endIndex {
            result.append(contentsOf: word2[j...])
        }
        
        return result
    }
}
