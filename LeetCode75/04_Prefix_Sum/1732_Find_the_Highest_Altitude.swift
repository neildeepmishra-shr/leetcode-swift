//
//  1732_Find_the_Highest_Altitude.swift
//  
//
//  Created by Neildeep Mishra on 03/11/26.
//
// Link: https://leetcode.com/problems/find-the-highest-altitude/
// Category: Prefix Sum
//
// Complexity:
// - Time: O(N) where N is the length of `gain` (single linear pass)
// - Space: O(1) auxiliary space (running prefix sum tracked in a scalar variable)
//

class Solution {
    func largestAltitude(_ gain: [Int]) -> Int {
        var altitude = 0
        var maxAltitude = 0
        
        for netGain in gain {
            altitude += netGain
            if altitude > maxAltitude {
                maxAltitude = altitude
            }
        }
        
        return maxAltitude
    }
}

/*
 // MARK: - Alternative Approach 1 (Concise Loop with `max(_:_:)`)
 // Uses the standard library `max` function to update the peak altitude in a single expression.
 
 class Solution {
     func largestAltitude(_ gain: [Int]) -> Int {
         var currentAltitude = 0
         var maxAltitude = 0
         
         for netGain in gain {
             currentAltitude += netGain
             maxAltitude = max(maxAltitude, currentAltitude)
         }
         
         return maxAltitude
     }
 }
 */

/*
 // MARK: - Alternative Approach 2 (Pro Swift Trick: Declarative `reduce(into:)`)
 // Uses `reduce(into:)` with a tuple `(current: 0, highest: 0)` to compute both the running
 // prefix sum and the maximum altitude in a single functional expression.
 
 class Solution {
     func largestAltitude(_ gain: [Int]) -> Int {
         return gain.reduce(into: (current: 0, highest: 0)) { state, netGain in
             state.current += netGain
             state.highest = max(state.highest, state.current)
         }.highest
     }
 }
 */
