//
//  1071_GCDOfStrings.swift
//  
//
//  Created by Neildeep Mishra on 15/10/26.
//
//
// 1071. Greatest Common Divisor of Strings
// Link: https://leetcode.com/problems/greatest-common-divisor-of-strings/
// Category: Array / String
//
// Complexity:
// - Time: O(M + N) where M and N are lengths of str1 and str2
// - Space: O(M + N) for concatenation memory
//

class Solution {
    func gcdOfStrings(_ str1: String, _ str2: String) -> String {
        guard str1 + str2 == str2 + str1 else {
            return ""
        }
        
        let gcdLength = gcd(str1.count, str2.count)
        return String(str1.prefix(gcdLength))
    }
    
    private func gcd(_ a: Int, _ b: Int) -> Int {
        b == 0 ? a : gcd(b, a % b)
    }
}
