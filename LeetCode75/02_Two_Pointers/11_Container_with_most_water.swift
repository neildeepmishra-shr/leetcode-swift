//
//  11_Container_with_most_water.swift
//  
//
//  Created by Neildeep Mishra on 31/10/26.
//
//
// Link: https://leetcode.com/problems/container-with-most-water/
// Category: Two Pointers (Opposite-Ends Greedy Shrink)
//
// Complexity:
// - Time: O(N) where N is the number of walls (each pointer moves at most N times)
// - Space: O(1) auxiliary space
//

class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var left = 0
        var right = height.count - 1
        var maxArea = 0
        
        while left < right {
            let area = min(height[left], height[right]) * (right - left)
            maxArea = max(maxArea, area)
            
            // Always move the pointer at the shorter (bottleneck) wall inward
            if height[left] < height[right] {
                left += 1
            } else {
                right -= 1
            }
        }
        
        return maxArea
    }
}

/*
 // MARK: - Alternative Approach (Fast-Forwarding Past Shorter Walls)
 // Skips redundant area calculations by advancing pointers past any walls
 // that are shorter than or equal to the current bottleneck height.
 
 class Solution {
     func maxArea(_ height: [Int]) -> Int {
         var left = 0
         var right = height.count - 1
         var maxArea = 0
         
         while left < right {
             let currentHeight = min(height[left], height[right])
             maxArea = max(maxArea, currentHeight * (right - left))
             
             // Fast-forward past walls that cannot beat the current bottleneck height
             while left < right && height[left] <= currentHeight {
                 left += 1
             }
             while left < right && height[right] <= currentHeight {
                 right -= 1
             }
         }
         
         return maxArea
     }
 }
 */
