//
//  724_Find_Pivot_Index.swift
//  
//
//  Created by Neildeep Mishra on 03/11/26.
//
//
// Link: https://leetcode.com/problems/find-pivot-index/
// Category: Prefix Sum
//
// Complexity:
// - Time: O(N) where N is the length of `nums` (one linear pass to compute total sum, one linear pass to find pivot)
// - Space: O(1) auxiliary space (scalar prefix and total sum variables)
//

class Solution {
    func pivotIndex(_ nums: [Int]) -> Int {
        let totalSum = nums.reduce(0, +)
        var leftSum = 0
        
        for (index, num) in nums.enumerated() {
            if leftSum == totalSum - leftSum - num {
                return index
            }
            leftSum += num
        }
        
        return -1
    }
}

/*
 // MARK: - Alternative Approach 1 (Explicit Prefix and Suffix Arrays)
 // Allocates explicit O(N) arrays to store running prefix sums from left-to-right
 // and right-to-left, checking equality at each index.
 
 class Solution {
     func pivotIndex(_ nums: [Int]) -> Int {
         guard !nums.isEmpty else { return -1 }
         let n = nums.count
         var leftSums = Array(repeating: 0, count: n)
         var rightSums = Array(repeating: 0, count: n)
         
         var currentLeft = 0
         for i in 0..<n {
             leftSums[i] = currentLeft
             currentLeft += nums[i]
         }
         
         var currentRight = 0
         for i in (0..<n).reversed() {
             rightSums[i] = currentRight
             currentRight += nums[i]
         }
         
         for i in 0..<n {
             if leftSums[i] == rightSums[i] {
                 return i
             }
         }
         
         return -1
     }
 }
 */

/*
 // MARK: - Alternative Approach 2 (Pro Swift Trick: Declarative Functional State Accumulation)
 // Uses `reduce(into:)` combined with index lookup to evaluate pivot conditions functionally.
 
 class Solution {
     func pivotIndex(_ nums: [Int]) -> Int {
         let totalSum = nums.reduce(0, +)
         var leftSum = 0
         
         return nums.enumerated().first { index, num in
             let isPivot = (leftSum == totalSum - leftSum - num)
             leftSum += num
             return isPivot
         }?.offset ?? -1
     }
 }
 */
