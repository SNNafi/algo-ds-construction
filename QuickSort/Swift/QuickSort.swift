//
// Created by Shahriar Nasim Nafi on 2/7/22.
//

func partitionArray<T: Comparable>(_ array: inout [T], start: Int, end: Int) -> Int {
    let pivot = array[end - 1]
    var p = start - 1
    
    for i in start..<end - 1 {
        if array[i] < pivot {
            p+=1
            (array[p], array[i]) =  (array[i], array[p])
        }
    }
    
    p+=1
    (array[p], array[end - 1]) =  (pivot, array[p])
    
    return p
}

extension Array where Element: Comparable {
    mutating func quickSort(start: Int? = nil, end: Int? = nil) {
        let start = start ?? 0
        let end = end ?? self.count
        
        if start >= end {
            return
        }
        
        let p = partitionArray(&self, start: start, end: end)
        
        quickSort(start: start, end: p)
        quickSort(start: p + 1, end: end)
    }
}
