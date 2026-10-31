//
//  1679_Max_Number_of_K-Sum_Pairs.swift
//  
//
//  Created by Neildeep Mishra on 31/10/26.
//
//
//
// Link: https://leetcode.com/problems/max-number-of-k-sum-pairs/
// Category: Two Pointers (Sorting + Opposite-Ends Pointers)
//
// Complexity:
// - Time: O(N log N) where N is the length of nums (dominated by sorting)
// - Space: O(N) in Swift to store the sorted copy of `nums`
//

class Solution {
    func maxOperations(_ nums: [Int], _ k: Int) -> Int {
        // Since 1 <= nums[i], two numbers must sum to at least 2
        if k <= 1 {
            return 0
        }
        
        let sortedNums = nums.sorted()
        var left = 0
        var right = sortedNums.count - 1
        var countOperations = 0
        
        while left < right {
            let sum = sortedNums[left] + sortedNums[right]
            
            if sum == k {
                countOperations += 1
                left += 1
                right -= 1
            } else if sum < k {
                left += 1
            } else {
                right -= 1
            }
        }
        
        return countOperations
    }
}

/*
 // MARK: - Alternative Approach (Single-Pass Hash Map / Frequency Counter)
 // Trades O(N) extra dictionary space to achieve O(N) linear time without sorting.
 
 class Solution {
     func maxOperations(_ nums: [Int], _ k: Int) -> Int {
         if k <= 1 { return 0 }
         
         var counts: [Int: Int] = [:]
         var countOperations = 0
         
         for num in nums {
             let complement = k - num
             
             // If the complement is already waiting in our dictionary, pair them up!
             if let available = counts[complement], available > 0 {
                 countOperations += 1
                 counts[complement] = available - 1
             } else {
                 // Otherwise, store `num` in the dictionary for a future match
                 counts[num, default: 0] += 1
             }
         }
         
         return countOperations
     }
 }
 */
