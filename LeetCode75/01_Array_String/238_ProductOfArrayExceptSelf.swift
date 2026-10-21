//
//  238_ProductOfArrayExceptSelf.swift
//  
//
//  Created by Neildeep Mishra on 21/10/26.

// Link: https://leetcode.com/problems/product-of-array-except-self/
// Category: Array / String (Prefix & Suffix Products)
//
// Complexity:
// - Time: O(N) where N is the length of nums (two linear passes)
// - Space: O(1) auxiliary space (excluding the output array, satisfying the follow-up)
//

class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        let count = nums.count
        var result = Array(repeating: 1, count: count)
        
        // Pass 1: Calculate prefix (left) products and store directly in `result`
        var runningLeft = 1
        for i in 0..<count {
            result[i] = runningLeft
            runningLeft *= nums[i]
        }
        
        // Pass 2: Calculate suffix (right) products on the fly and multiply into `result`
        var runningRight = 1
        for i in (0..<count).reversed() {
            result[i] *= runningRight
            runningRight *= nums[i]
        }
        
        return result
    }
}

/*
 // MARK: - Alternative Approach (Explicit Left and Right Arrays)
 // Easier to visualize initially, uses O(N) auxiliary space for `left` and `right` arrays.
 
 class Solution {
     func productExceptSelf(_ nums: [Int]) -> [Int] {
         var result: [Int] = []
         var left: [Int] = []
         var right: [Int] = []
         
         var runningLeft = 1
         for i in 0..<nums.count {
             left.append(runningLeft)
             runningLeft *= nums[i]
         }
         
         var runningRight = 1
         for i in (0..<nums.count).reversed() {
             right.append(runningRight)
             runningRight *= nums[i]
         }
         
         right.reverse()
         
         for i in 0..<nums.count {
             result.append(left[i] * right[i])
         }
         
         return result
     }
 }
 */
