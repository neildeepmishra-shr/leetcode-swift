//
//  283_Move_Zeroes.swift
//  
//
//  Created by Neildeep Mishra on 27/10/26.
//
//
// 
// Link: https://leetcode.com/problems/move-zeroes/
// Category: Two Pointers (Read / Write In-Place Partitioning)
//
// Complexity:
// - Time: O(N) where N is the length of nums (single pass)
// - Space: O(1) auxiliary space (in-place modification)
//

class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var write = 0
        
        for read in 0..<nums.count {
            if nums[read] != 0 {
                // Follow-up optimization: only perform the write/swap when pointers differ,
                // avoiding redundant self-writes when leading elements are already non-zero.
                if read != write {
                    nums[write] = nums[read]
                    nums[read] = 0
                }
                write += 1
            }
        }
    }
}

/*
 // MARK: - Alternative Approach (Using Standard Library `swapAt`)
 // Clean and concise single-pass two-pointer swap.
 
 class Solution {
     func moveZeroes(_ nums: inout [Int]) {
         var write = 0
         
         for read in 0..<nums.count {
             if nums[read] != 0 {
                 nums.swapAt(write, read)
                 write += 1
             }
         }
     }
 }
 */
