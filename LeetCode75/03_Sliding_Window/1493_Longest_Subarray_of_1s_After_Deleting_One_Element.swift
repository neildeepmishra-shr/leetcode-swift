//
//  1493_Longest_Subarray_of_1s_After_Deleting_One_Element.swift
//  
//
//  Created by Neildeep Mishra on 01/11/26.
//
// Link: https://leetcode.com/problems/longest-subarray-of-1s-after-deleting-one-element/
// Category: Sliding Window (Variable-Size Window)
//
// Complexity:
// - Time: O(N) where N is the length of `nums`
// - Space: O(1) auxiliary space
//

class Solution {
    func longestSubarray(_ nums: [Int]) -> Int {
        // 1. Early exit: count 1s and 0s upfront using `count(where:)`
        let onesCount = nums.count(where: { $0 == 1 })
        let zerosCount = nums.count - onesCount
        
        // If there are at most 1 zero, the entire array minus 1 element is valid
        if zerosCount <= 1 {
            return nums.count - 1
        }
        
        // 2. Non-shrinking sliding window for arrays with 2 or more zeroes
        var left = 0
        var deleteLimit = 1
        
        for right in nums.indices {
            if nums[right] == 0 {
                deleteLimit -= 1
            }
            
            // Window becomes invalid when it contains more than 1 zero (deleteLimit < 0)
            if deleteLimit < 0 {
                if nums[left] == 0 {
                    deleteLimit += 1
                }
                left += 1
            }
        }
        
        // Total window size `(nums.count - left)` minus 1 for the mandatory deleted element
        return nums.count - left - 1
    }
}

/*
 // MARK: - Alternative Approach 1 (Early Exit + Branchless Binary Math)
 // Combines the `count(where:)` early exit with branchless `(1 - num)` arithmetic to update
 // `remainingDeletes` without inner conditional branches.
 
 class Solution {
     func longestSubarray(_ nums: [Int]) -> Int {
         let onesCount = nums.count(where: { $0 == 1 })
         let zerosCount = nums.count - onesCount
         
         if zerosCount <= 1 {
             return nums.count - 1
         }
         
         let deleteLimit = 1
         var remainingDeletes = deleteLimit
         var left = 0
         
         for (_, num) in nums.enumerated() {
             // Subtract 1 if num == 0, or 0 if num == 1
             remainingDeletes -= (1 - num)
             
             if remainingDeletes < 0 {
                 // Restore 1 delete if the outgoing element at `left` was 0
                 remainingDeletes += (1 - nums[left])
                 left += 1
             }
         }
         
         return nums.count - left - 1
     }
 }
 */

/*
 // MARK: - Alternative Approach 2 (Single-Pass Standard Shrinking Window)
 // Avoids the initial `count(where:)` pass by tracking `maxLength = max(maxLength, right - left)`
 // in a single traversal. Because `right - left` already subtracts 1 from the window size
 // `(right - left + 1)`, it handles the all-1s edge case automatically in one pass.
 
 class Solution {
     func longestSubarray(_ nums: [Int]) -> Int {
         var left = 0
         var zeroCount = 0
         var maxLength = 0
         
         for right in nums.indices {
             zeroCount += (1 - nums[right])
             
             while zeroCount > 1 {
                 zeroCount -= (1 - nums[left])
                 left += 1
             }
             
             maxLength = max(maxLength, right - left)
         }
         
         return maxLength
     }
 }
 */
