// MARK: - previously done

// Two sum - Easy
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var map: [Int: [Int]] = [:]
    nums.enumerated().forEach { (idx, el) in
        if var arr = map[el] {
            arr.append(idx)
            map[el] = arr
        } else {
            map[el] = [idx]
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

let array = [1,8,6,2,5,4,8,3,7]
// ER = 49
print(maxArea(array))