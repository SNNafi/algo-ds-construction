//
// Created by Shahriar Nasim Nafi on 28/6/22.
//

extension Array where Element: Comparable {
    func selectionSort() -> [Element] {
        var sorted = self
        var minIdx: Int
        for i in 0..<sorted.count - 1 {
            minIdx = i
            for j in (i+1)..<sorted.count {
                if sorted[j] < sorted[minIdx] {
                    minIdx = j
                }
            }
            if minIdx != i {
                (sorted[minIdx], sorted[i]) = (sorted[i], sorted[minIdx])
            }
        }
        return sorted
    }
}
