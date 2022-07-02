//
// Created by Shahriar Nasim Nafi on 2/7/22.
//

func merge<T: Comparable>(left: [T], right: [T]) -> [T] {
    var merged = [T]()

    var i = 0
    var j = 0

    while i < left.count && j < right.count {
        if left[i] < right[j] {
            merged.append(left[i])
            i+=1

        } else if left[i] > right[j] {
            merged.append(right[j])
            j+=1

        } else {
            merged.append(left[i])
            merged.append(right[j])
            i+=1
            j+=1

        }
    }

    while i < left.count {
        merged.append(left[i])
        i+=1
    }

    while j < right.count {
        merged.append(right[j])
        j+=1
    }

    return merged
}

public extension Array where Element: Comparable {

    func mergeSorted() -> [Element] {
        guard self.count > 1 else { return self }

        let midIndex = self.count / 2

        var left = Array(self[0..<midIndex])
        var right = Array(self[midIndex..<self.count])

        left = left.mergeSorted()
        right = right.mergeSorted()

        return merge(left: left, right: right)
    }
}
