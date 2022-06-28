//
// Created by Shahriar Nasim Nafi on 29/6/22.
//

extension Array where Element: Comparable {
    func binarySearch(for item: Element) -> Int? {
        var left = 0
        var right = self.count - 1
        var mid = (left + right) / 2
        
        while left <= right {
            mid = (left + right) / 2
            if self[mid] > item {
                right = mid - 1
            } else if self[mid] < item {
                left = mid + 1
            } else {
                return mid
            }
        }
        return nil
    }
}
