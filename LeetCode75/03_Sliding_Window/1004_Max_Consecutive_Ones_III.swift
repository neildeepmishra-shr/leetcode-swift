//
//  1004_Max_Consecutive_Ones_III.swift
//  
//
//  Created by Neildeep Mishra on 01/11/26.
//
//
//
// Link: https://leetcode.com/problems/max-consecutive-ones-iii/
// Category: Sliding Window (Variable-Size Window)
//
// Complexity:
// - Time: O(N) where N is the length of `nums` (both `left` and `right` traverse the array at most once)
// - Space: O(1) auxiliary space
//

class Solution {
    func longestOnes(_ nums: [Int], _ k: Int) -> Int {
        var left = 0
        var zeroCount = 0
        var maxLength = 0
        
        for right in 0..<nums.count {
            // 1. Expand the window by including `nums[right]`
            if nums[right] == 0 {
                zeroCount += 1
            }
            
            // 2. Shrink the window from the left while it contains more than `k` zeroes
            while zeroCount > k {
                if nums[left] == 0 {
                    zeroCount -= 1
                }
                left += 1
            }
            
            // 3. Update the maximum valid window size
            maxLength = max(maxLength, right - left + 1)
        }
        
        return maxLength
    }
}

/*
 // MARK: - Alternative Approach 1 (Non-Shrinking Monotonic Window)
 // Instead of shrinking the window with a `while` loop, shifts `left` by 1 using an `if`
 // statement whenever `zeroCount > k`. Because the window never shrinks below the largest
 // valid size found so far, `nums.count - left` at the end is guaranteed to be the maximum length.
 
 class Solution {
     func longestOnes(_ nums: [Int], _ k: Int) -> Int {
         var left = 0
         var zeroCount = 0
         
         for right in 0..<nums.count {
             if nums[right] == 0 {
                 zeroCount += 1
             }
             
             if zeroCount > k {
                 if nums[left] == 0 {
                     zeroCount -= 1
                 }
                 left += 1
             }
         }
         
         return nums.count - left
     }
 }
 */

/*
 // MARK: - Alternative Approach 2 (Pro Swift Trick: Branchless Binary Math + `enumerated()`)
 // In a binary array (only 0s and 1s), `1 - num` (or bitwise `num ^ 1`) equals 1 when `num` is 0,
 // and 0 when `num` is 1. Combining this with `.enumerated()` eliminates inner `if` branches
 // and reduces CPU branch-prediction misses.
 
 class Solution {
     func longestOnes(_ nums: [Int], _ k: Int) -> Int {
         var left = 0
         var remainingFlips = k
         
         for (_, num) in nums.enumerated() {
             // Subtract 1 from remainingFlips if num == 0, or 0 if num == 1
             remainingFlips -= (1 - num)
             
             if remainingFlips < 0 {
                 // Restore 1 flip if the outgoing element at `left` was 0
                 remainingFlips += (1 - nums[left])
                 left += 1
             }
         }
         
         return nums.count - left
     }
 }
 */
