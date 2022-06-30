//
// Created by Shahriar Nasim Nafi on 30/6/22.
//

/// Circular Queue
struct Queue<T> {
    
    private var head: Int = 0
    private var tail: Int = 0
    private let maximum: Int
    private var data: [T?] = []
    
    /// Create circular `Queue`
    /// - Parameter maximum: maximum element it can store
    init(maximum: Int) {
        self.maximum = maximum
        data = Array(repeating: nil, count: maximum + 1)
    }
    
    /// Enqueue element in `Queue`.
    ///  Time Complexity: 0(1)
    /// - Parameter Element to enqueue:
    /// - Returns: If `Queue` is full return `false` else return `true` uppon enqueuing
    mutating func enqueue(_ element: T) -> Bool {
        if ((tail + 1) % (maximum + 1)) == head {
            return false
        }
        
        data[tail] = element
        tail = ((tail + 1) % (maximum + 1))
        
        return true
    }
    
    /// Dequeue element from `Queue`
    /// - Returns: If `Queue` empty return `nil` else return element
    mutating func dequeue() -> T? {
        if head == tail {
            return nil
        }
        
        let element = data[head]
        head = ((head + 1) % (maximum + 1))
        return element
    }
    
}
