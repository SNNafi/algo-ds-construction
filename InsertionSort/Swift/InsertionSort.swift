//
// Created by Shahriar Nasim Nafi on 28/6/22.
//

extension Array where Element: Comparable {
    func insertionSort() -> [Element] {
        var sorted = self
        for i in 1..<sorted.count {
            let value = sorted[i]
            var j = i - 1
            while(j >= 0 && value < sorted[j]) {
                sorted[j + 1] = sorted[j]
                j-=1
            }
            sorted[j + 1] = value
        }
        return sorted
    }
}
