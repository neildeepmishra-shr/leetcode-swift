# leetcode-swift
Solutions and notes for LeetCode 75 and Top Interview 150 in idiomatic Swift, focusing on clean code, best practices, and complexity analysis.
# LeetCode 75 — Swift Solutions & Pattern Guide

A structured repository of optimal **Swift** solutions for the [LeetCode 75 Study Plan](https://leetcode.com/studyplan/leetcode-75/), organized by algorithmic pattern with time/space complexity analysis and alternative approaches documented in code.

## 📊 Milestone Progress

| # | Category | Directory | Progress | Status |
| :--- | :--- | :--- | :--- | :--- |
| 01 | **Array / String** | [`01_Array_String`](./01_Array_String) | **9 / 9** | ✅ Complete |
| 02 | **Two Pointers** | [`02_Two_Pointers`](./02_Two_Pointers) | **4 / 4** | ✅ Complete |
| 03 | **Sliding Window** | [`03_Sliding_Window`](./03_Sliding_Window) | **1 / 4** | 🔄 In Progress |

---

## 🗂️ Problem Log by Category

### 01. Array / String (9 / 9)

| # | Problem | Difficulty | Time | Space | Core Pattern & Takeaway |
| :--- | :--- | :--- | :--- | :--- | :--- |
| 1 | [1768. Merge Strings Alternately](./01_Array_String/1768_MergeStringsAlternately.swift) | Easy | $O(N + M)$ | $O(N + M)$ | Single pointer up to `max(count1, count2)` appending valid characters from each string. |
| 2 | [1071. Greatest Common Divisor of Strings](./01_Array_String/1071_GreatestCommonDivisorOfStrings.swift) | Easy | $O(N + M)$ | $O(N + M)$ | Check `str1 + str2 == str2 + str1`; if true, prefix length is `gcd(str1.count, str2.count)`. |
| 3 | [1431. Kids With the Greatest Number of Candies](./01_Array_String/1431_KidsWithTheGreatestNumberOfCandies.swift) | Easy | $O(N)$ | $O(N)$ | Find global `max()` once upfront, then compare `candy + extraCandies >= maxCandies`. |
| 4 | [605. Can Place Flowers](./01_Array_String/605_CanPlaceFlowers.swift) | Easy | $O(N)$ | $O(1)$ | Greedy scan checking `(i == 0 \|\| bed[i-1] == 0)` and `(i == count-1 \|\| bed[i+1] == 0)`. |
| 5 | [345. Reverse Vowels of a String](./01_Array_String/345_ReverseVowelsOfAString.swift) | Easy | $O(N)$ | $O(N)$ | Opposite-ends pointers (`left`, `right`) + `Set<Character>` for $O(1)$ vowel lookup. |
| 6 | [151. Reverse Words in a String](./01_Array_String/151_ReverseWordsInAString.swift) | Medium | $O(N)$ | $O(N)$ | Split/reverse words or in-place whole-array reverse followed by per-word reverse. |
| 7 | [238. Product of Array Except Self](./01_Array_String/238_ProductOfArrayExceptSelf.swift) | Medium | $O(N)$ | $O(1)$ | Two-pass prefix product (left-to-right) and running suffix multiplier (right-to-left) without division. |
| 8 | [334. Increasing Triplet Subsequence](./01_Array_String/334_IncreasingTripletSubsequence.swift) | Medium | $O(N)$ | $O(1)$ | Greedy threshold tracking with `first = Int.max` and `second = Int.max` via `if / else if / else`. |
| 9 | [443. String Compression](./01_Array_String/443_StringCompression.swift) | Medium | $O(N)$ | $O(1)$ | Same-direction `read` and `write` pointers to count consecutive character streaks in-place. |

### 02. Two Pointers (4 / 4)

| # | Problem | Difficulty | Time | Space | Core Pattern & Takeaway |
| :--- | :--- | :--- | :--- | :--- | :--- |
| 10 | [283. Move Zeroes](./02_Two_Pointers/283_MoveZeroes.swift) | Easy | $O(N)$ | $O(1)$ | Same-direction `read` and `write` pointers; swap non-zero elements to `write` index via `swapAt`. |
| 11 | [392. Is Subsequence](./02_Two_Pointers/392_IsSubsequence.swift) | Easy | $O(T)$ | $O(S + T)$ | Parallel pointers across `s` and `t` (plus Dictionary + Binary Search follow-up for $10^9$ queries). |
| 12 | [11. Container With Most Water](./02_Two_Pointers/11_ContainerWithMostWater.swift) | Medium | $O(N)$ | $O(1)$ | Opposite-ends `left` and `right` pointers; greedily move the shorter (bottleneck) wall inward. |
| 13 | [1679. Max Number of K-Sum Pairs](./02_Two_Pointers/1679_MaxNumberOfKSumPairs.swift) | Medium | $O(N \log N)$ | $O(N)$ | Sort array then converge `left` and `right` pointers based on `sum == k`, `sum < k`, or `sum > k`. |

---

## 🧠 Swift Algorithm & Syntax Cheat Sheet

### 1. Array / String Core Patterns & Swift Nuances
* **Why `Array(s)` Is Essential in Swift:** Swift `String` characters (Extended Grapheme Clusters) have variable memory widths, meaning direct integer indexing (`s[i]`) is not $O(1)$ and is disallowed by the compiler. Converting `let chars = Array(s)` creates a `[Character]` array with $O(1)$ random access.
* **Prefix & Suffix Decomposition (#238):** Whenever a problem asks for the combined result of "everything except index `i`" without using division, compute the **left prefix** into the output array on pass 1, and multiply by a single **running right suffix** variable on pass 2 for $O(1)$ auxiliary space.
* **Greedy Threshold Tracking (#334):** To detect an increasing subsequence of length $k$ in $O(1)$ space, maintain threshold variables initialized to `Int.max`. Using `if num <= first` / `else if num <= second` / `else return true` guarantees a valid triplet even if `first` updates to a smaller value later in the array.

### 2. Two Pointers Decision Guide
Every Two-Pointer problem falls into one of **three structural templates**:

1. **Same-Direction `read` & `write` Pointers (In-Place Array Compaction — #443, #283):**
   * Both start at index `0`.
   * `read` scans every element; `write` only advances when a valid element is written or swapped into place.
   ```swift
   var write = 0
   for read in 0..<nums.count {
       if nums[read] != 0 {
           nums.swapAt(write, read)
           write += 1
       }
   }
   ```

2. **Parallel Pointers Across Two Inputs (#392):**
   * `sIndex = 0` tracks the target checklist; `tIndex = 0` scans the source array.
   * Advance `sIndex` only on a match; advance `tIndex` on every iteration.

3. **Opposite-Ends `left` & `right` Pointers (#345, #11, #1679):**
   * `left = 0` and `right = count - 1`, looping `while left < right`.
   * **Greedy Shrink (#11):** Move the pointer that bottlenecks the current answer (`height[left] < height[right] ? (left += 1) : (right -= 1)`).
   * **Sorted Two-Sum (#1679):** After `.sorted()`, if `sum < k` increment `left += 1` (need larger value); if `sum > k` decrement `right -= 1` (need smaller value).

### 3. Essential Swift Standard Library Toolkit (Used So Far)
* `nums.swapAt(i, j)` — Swaps two array elements in-place in $O(1)$ time without a temporary variable.
* `Set("aeiouAEIOU")` — Provides $O(1)$ `.contains(char)` lookups instead of $O(N)$ array scans.
* `for (index, char) in t.enumerated()` — Iterates over both the integer index and element simultaneously.
* `dict[key, default: []].append(val)` / `dict[key, default: 0] += 1` — Safely initializes missing dictionary keys in a single line.
* `nums[0..<k].reduce(0, +)` — Sums a contiguous `ArraySlice` declaratively.
