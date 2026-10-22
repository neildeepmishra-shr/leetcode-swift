//
//  334_IncreasingTripletSubsequence.swift
//  
//
//  Created by Neildeep Mishra on 22/10/26.
//
//
// Link: https://leetcode.com/problems/increasing-triplet-subsequence/
// Category: Array / String (Greedy)
//
// Complexity:
// - Time: O(N) where N is the length of nums (single pass)
// - Space: O(1) auxiliary space (only two state variables used)
//

class Solution {
    func increasingTriplet(_ nums: [Int]) -> Bool {
        guard nums.count >= 3 else { return false }
        
        var first = Int.max
        var second = Int.max
        
        for num in nums {
            if num <= first {
                // Found a new smallest candidate for the 1st element of the triplet
                first = num
            } else if num <= second {
                // `num` is strictly greater than `first`, making it the best candidate for the 2nd element
                second = num
            } else {
                // `num` is strictly greater than both `first` and `second` (`first < second < num`)
                return true
            }
        }
        
        return false
    }
}
