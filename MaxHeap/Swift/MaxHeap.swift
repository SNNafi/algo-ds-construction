//
// Created by Shahriar Nasim Nafi on 4/7/22.
//

struct MaxHeapify<T: Comparable> {
    static func leftChild(for index: Int) -> Int {
        index * 2
    }
    
    static func rightChild(for index: Int) -> Int {
        index * 2 + 1
    }
    
    static func parent(for index: Int) -> Int {
        index / 2
    }
    
    static func maxHeapify(heap: inout [T], heapSize: Int, root: Int) {
        var largest = root
        let left = leftChild(for: root)
        let right = rightChild(for: root)
        
        if left <= heapSize && heap[left] > heap[largest] {
            largest = left
        }
        
        if right <= heapSize && heap[right] > heap[largest] {
            largest = right
        }
        
        if largest != root {
            (heap[root], heap[largest]) = (heap[largest], heap[root])
            maxHeapify(heap: &heap, heapSize: heapSize, root: largest)
        }
    }
    
    static func buildMaxHeap(heap: inout [T], heapSize: Int) {
        for i in stride(from: heapSize / 2, to: 0, by: -1) {
            maxHeapify(heap: &heap, heapSize: heapSize, root: i)
        }
    }
    
    static func printMaxHeap(heap: [T], heapSize: Int, root: Int) {
        if root > heapSize {
            return
        }
        
        print(heap[root])
        
        let left = leftChild(for: root)
        let right = rightChild(for: root)
        
        if (left <= heapSize) {
            print(heap[root], "->", heap[left])
        }
        
        if (right <= heapSize) {
            print(heap[root], "->", heap[right])
        }
        
        printMaxHeap(heap: heap, heapSize: heapSize, root: left)
        printMaxHeap(heap: heap, heapSize: heapSize, root: right)
        
    }
}
