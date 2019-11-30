// MARK: - previously done

// Two sum - Easy
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var map: [Int: [Int]] = [:]
    for i in nums.enumerated() {
        if var arr = map[i.element] {
            arr.append(i.offset)
            map[i.element] = arr
        } else {
            map[i.element] = [i.offset]
        }
    }
    for (idx, i) in nums.enumerated() {
        let seeked = target - i
        if
            let seekedIdx = map[seeked],
            !seekedIdx.isEmpty {
            for exSeekedIdx in seekedIdx {
                if exSeekedIdx != idx {
                    return [idx, exSeekedIdx]
                }
            }
        }
    }
    return []
}

// Median of two sorted arrays - hard
func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    let isEven = (nums1.count + nums2.count) % 2 == 0
    let half = isEven
        ? (nums1.count + nums2.count) / 2 - 1
        : (nums1.count + nums2.count) / 2
    var i1 = 0
    var i2 = 0
    func next() -> Int {
        guard i1 < nums1.count else {
            let result = nums2[i2]
            i2 += 1
            return result
        }
        guard i2 < nums2.count else {
            let result = nums1[i1]
            i1 += 1
            return result
        }
        if nums1[i1] < nums2[i2] {
            let result = nums1[i1]
            i1 += 1
            return result
        } else {
            let result = nums2[i2]
            i2 += 1
            return result
        }
    }
    var median = 0.0
    while i1 + i2 <= half {
        median = Double(next())
    }
    if isEven {
        median = (median + Double(next())) / 2
    }
    return median
}

// MARK: - 11.11
// Container with most water - medium
func maxArea(_ height: [Int]) -> Int {
    var leftIdx = 0
    var rightIdx = height.count - 1
    var maxArea = 0
    while leftIdx != rightIdx {
        maxArea = max(
            maxArea,
            (rightIdx - leftIdx) * min(height[leftIdx], height[rightIdx])
        )
        if height[leftIdx] >= height[rightIdx] {
            rightIdx -= 1
        } else {
            leftIdx += 1
        }
    }
    return maxArea
}

func testMaxArea() {
    let array = [1,8,6,2,5,4,8,3,7]
    // ER = 49
    print(maxArea(array))
}

// MARK: - 18.11
// 3Sum - medium
func threeSum(_ nums: [Int]) -> [[Int]] {

    // create hashmap of numbers with number of their occurancies
    var set: [Int: Int] = [:]
    for i in 0..<nums.count {
        let curOccur = set[nums[i]] ?? 0
        if curOccur < 3 {
            set[nums[i]] = curOccur + 1
        }
    }

    // create shrinked version of list where there are only 3 occurancies of every number
    var numsReduced: [Int] = []
    for i in set {
        for _ in 0..<i.value {
            numsReduced.append(i.key)
        }
    }
    var results = Set<[Int]>()
    for i in 0..<numsReduced.count {
        // remove 1 occurancy of current number
        if let index = set[numsReduced[i]] {
            set[numsReduced[i]] = index - 1
        }
        // iterate over subarray
        for j in (i + 1)..<numsReduced.count {

            let target = -(numsReduced[j] + numsReduced[i])

            if let numberOfTargetEntries = set[target], numberOfTargetEntries >= 1 {
                // don't count current second number
                if target == numsReduced[j] && numberOfTargetEntries == 1 {
                    continue
                }

                results.insert([numsReduced[i], numsReduced[j], target].sorted())
            }
        }
    }
    return Array(results)
}

func testThreeSum() {
    let nums = [-1, 0, 1, 2, -1, -4]
    // ER = [[-1, 0, 1], [-1, -1, 2]]
    print(threeSum(nums))
}

//testThreeSum()

// MARK: - 30.11
// Remove duplicates - Easy

func removeDuplicates(_ nums: inout [Int]) -> Int {
    var i = 0, j = 1
    while i < nums.count - 1 {
        if nums[i] != nums[i + 1]  {
            nums[j] = nums[i + 1]
            j += 1
        }
        i += 1
    }
    return nums.isEmpty ? 0 : j
}

func testRemoveDuplicates() {
    var nums: [Int] = [0,0,1,1,1,2,2,3,3,4]
    // ER =  5, [0,1,2,3,4...]
    print(removeDuplicates(&nums))
    print(nums)
}

//testRemoveDuplicates()







