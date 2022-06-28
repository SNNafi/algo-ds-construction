//
// Created by Shahriar Nasim Nafi on 29/6/22.
//

struct Stack<T> {
    private var data = [T]()
    
    mutating func push(_ item: T) {
        data.append(item)
    }
    
    mutating func pop() -> T? {
        data.popLast()
    }
}

extension Stack: Collection {
    typealias Index = Int
    typealias Element = T
    
    var startIndex: Int {
        data.startIndex
    }
    
    var endIndex: Int {
        data.endIndex
    }
    
    subscript(position: Int) -> T {
        data[position]
    }
    
    func index(after i: Int) -> Int {
        data.index(after: i)
    }
}
