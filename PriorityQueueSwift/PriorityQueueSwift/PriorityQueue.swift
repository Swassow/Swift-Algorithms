//
//  PriorityQueue.swift
//  PriorityQueueSwift
//
//  Created by Swassow on 1/10/24.
//

import Foundation

class PriorityQueue<T> {
    private var nodes = [T]()
    private var orderCriteria: (T, T) -> Bool
    
    private func parent(_ child:Int)->Int
    {
        return (child-1)/2
    }
    
    private func leftChild(_ parent:Int)->Int
    {
        return ((2 * parent) + 1)
    }
    
    private func rightChild(_ parent:Int)->Int
    {
        return ((2 * parent) + 2)
    }
    private func shiftUp(_ index: Int)
    {
        var childIndex = index
        let child = nodes[childIndex]
        var parentIndex = parent(childIndex)
        
        while childIndex > 0 && orderCriteria(child, nodes[parentIndex]) {
            nodes[childIndex] = nodes[parentIndex]
            childIndex = parentIndex
            parentIndex = parent(childIndex)
        }
        nodes[childIndex] = child
    }
    private func shiftDown(from index: Int, until endIndex: Int)
    {
        let leftChildIndex = leftChild(index)
        let rightChildIndex = rightChild(index)
        
        var first = index
        if leftChildIndex < endIndex && orderCriteria(nodes[leftChildIndex], nodes[first]) {
          first = leftChildIndex
        }
        if rightChildIndex < endIndex && orderCriteria(nodes[rightChildIndex], nodes[first]) {
          first = rightChildIndex
        }
        if first == index { return }
        
        nodes.swapAt(index, first)
        shiftDown(from: first, until: endIndex)
    }
    
    private func heapify(from array:[T]) {
        nodes = array
        for i in stride(from: (nodes.count/2-1), through: 0, by: -1) {
            shiftDown(from: i, until: nodes.count)
        }
    }
    
    public init(sort: @escaping (T, T) -> Bool) {
        self.orderCriteria = sort
    }
    
    public init(_ array: [T] = [T](),sort: @escaping (T, T) -> Bool) {
        self.orderCriteria = sort
        heapify(from: array)
    }
    
    public func push(_ item:T) {
        nodes.append(item)
        let size = nodes.count-1
        shiftUp(size)
    }
    
    public func pop() {
        
        guard !nodes.isEmpty else { return  }
        
        if nodes.count == 1 {
            nodes.removeLast()
        }
        else {
            nodes[0] = nodes.removeLast()
            shiftDown(from: 0, until: nodes.count)
        }
    }
    
    public func top()->T {
        return nodes[0]
    }
    public func size()->Int {
        return nodes.count
    }
    
}
