//
//  643_Maximum_Average_SubarrayI.swift
//  
//
//  Created by Neildeep Mishra on 31/10/26.
//
//
//
// Link: https://leetcode.com/problems/maximum-average-subarray-i/
// Category: Sliding Window (Fixed-Size Window)
//
// Complexity:
// - Time: O(N) where N is the length of nums (each element is added and removed at most once)
// - Space: O(1) auxiliary space
//

class Solution {
    func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {
        // 1. Sum the initial window of size `k` (indices 0 through k - 1)
        var currentSum = 0
        for i in 0..<k {
            currentSum += nums[i]
        }
        
        // 2. Initialize `maxSum` with the first window's sum
        var maxSum = currentSum
        
        // 3. Slide the window one element at a time from index `k` to the end
        for i in k..<nums.count {
            currentSum += nums[i] - nums[i - k]
            maxSum = max(maxSum, currentSum)
        }
        
        return Double(maxSum) / Double(k)
    }
}

/*
 // MARK: - Alternative Approach 1 (Idiomatic Swift ArraySlice + `reduce(0, +)`)
 // Uses Swift's zero-cost `ArraySlice` (`nums[0..<k]`) and `.reduce(0, +)` to compute
 // the initial window sum declaratively before sliding the window in O(N) time.
 // (Note: Calling `.reduce(0, +)` only once on the initial window keeps the algorithm O(N),
 // whereas calling `.reduce(0, +)` inside the loop on every subarray would be O(N * k)).
 
 class Solution {
     func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {
         var currentSum = nums[0..<k].reduce(0, +)
         var maxSum = currentSum
         
         for i in k..<nums.count {
             currentSum += nums[i] - nums[i - k]
             maxSum = max(maxSum, currentSum)
         }
         
         return Double(maxSum) / Double(k)
     }
 }
 */

/*
 // MARK: - Alternative Approach 2 (Explicit `while` Pointer Loop)
 // Uses an explicit index pointer `i` and conditional `if` check while sliding the window.
 
 class Solution {
     func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {
         var currentSum = 0
         for j in 0..<k {
             currentSum += nums[j]
         }
         
         var maxSum = currentSum
         var i = k
         
         while i < nums.count {
             currentSum += nums[i] - nums[i - k]
             if currentSum > maxSum {
                 maxSum = currentSum
             }
             i += 1
         }
         
         return Double(maxSum) / Double(k)
     }
 }
 */
