//
// Created by Shahriar Nasim Nafi on 28/6/22.
//

extension Array where Element: Comparable {
    func bubbleSort() -> [Element] {
        var sorted = self
        for i in 0..<sorted.count {
            for j in 0..<(sorted.count - i - 1) {
                if sorted[j] > sorted[j + 1] {
                    (sorted[j], sorted[j + 1]) = (sorted[j + 1], sorted[j])
                }
            }
        }
        return sorted
    }
}
