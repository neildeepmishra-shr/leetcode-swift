//
//  605_CanPlaceFlowers.swift
//  
//
//  Created by Neildeep Mishra on 16/10/26.
//
// Link: https://leetcode.com/problems/can-place-flowers/
// Category: Array / String (Greedy)
//
// Complexity:
// - Time: O(N) where N is the length of flowerbed
// - Space: O(1) — no copy of the array is made; we jump the index by 2 upon planting
//

class Solution {
    func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
        if n == 0 { return true }
        
        var remainingFlowers = n
        let count = flowerbed.count
        var i = 0
        
        while i < count {
            if flowerbed[i] == 0 {
                let isLeftEmpty = (i == 0) || (flowerbed[i - 1] == 0)
                let isRightEmpty = (i == count - 1) || (flowerbed[i + 1] == 0)
                
                if isLeftEmpty && isRightEmpty {
                    remainingFlowers -= 1
                    if remainingFlowers == 0 {
                        return true
                    }
                    
                    // Since we planted at `i`, `i + 1` cannot be used.
                    // Jump ahead by 2 to save time and avoid mutating the array.
                    i += 2
                    continue
                }
            }
            
            i += 1
        }
        
        return remainingFlowers <= 0
    }
}
