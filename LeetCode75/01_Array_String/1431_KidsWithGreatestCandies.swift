//
//  1431_KidsWithGreatestCandies.swift
//  
//
//  Created by Neildeep Mishra on 15/10/26.
//
// Link: https://leetcode.com/problems/kids-with-the-greatest-number-of-candies/
// Category: Array / String
//
// Complexity:
// - Time: O(N) where N is the number of kids
// - Space: O(1) auxiliary space (excluding the output array)
//

//class Solution {
//    func kidsWithCandies(_ candies: [Int], _ extraCandies: Int) -> [Bool] {
//        let maxCandies = candies.max() ?? 0
//        var result = [Bool]()
//        result.reserveCapacity(candies.count)
//
//        for candy in candies {
//            result.append(candy + extraCandies >= maxCandies)
//        }
//
//        return result
//    }
//}

class Solution {
    func kidsWithCandies(_ candies: [Int], _ extraCandies: Int) -> [Bool] {
        let maxCandies = candies.max() ?? 0
        return candies.map { $0 + extraCandies >= maxCandies }
    }
}

