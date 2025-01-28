---
title: "2657. Find the Prefix Common Array of Two Arrays"
date: "2025-01-17"
authors: ["jat"]
topic: "coding-interviews"
tags: ["data-structures", "algorithms", "problem-solving", "python"]
video: "https://youtu.be/MTjiZaZH62A"
---

# [Fri, Jan 17](day://2025.01.17) - [2657. Find the Prefix Common Array of Two Arrays](https://leetcode.com/problems/find-the-prefix-common-array-of-two-arrays/)

```python
class Solution:
    def findThePrefixCommonArray(self, A: List[int], B: List[int]) -> List[int]:
        # A = [1,3,2,4], B = [3,1,2,4]
        # [0, 2, 3, 4]
        # counter of numbers that are present both in A and B
        # set that contains the numbers that appeared only once and remove them as soon as they appear twice (in the other array)

        res = []
        curr_cnt = 0
        pending_num = set()

        if len(A) != len(B):
            return []
        
        def add(arr, idx):
            if arr[idx] in pending_num:
                nonlocal curr_cnt
                curr_cnt += 1
                pending_num.remove(arr[idx])
            else:
                pending_num.add(arr[idx])

        for i in range(len(A)):
            add(A, i)
            add(B, i)
            res.append(curr_cnt)
        
        return res

        # A = [2,3,1], B = [3,1,2]
        # 0 {2,3} 0
        # 1 {2, 1} 1
        # 2 {} 3
        # [0, 1, 3]
```

[LeetCode 2657 - Find the Prefix Common Array of Two Arrays | How I’d Solve It in a Coding Interview](https://youtu.be/MTjiZaZH62A)

