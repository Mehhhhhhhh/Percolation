//
//  main.swift
//  QueueBagStacks
//
//  Created by meh on 3/2/17.
//  Copyright © 2017 ForeCyte. All rights reserved.
//

import Foundation
//
//var stack: StackAPI = LinkedListStack()
//stack.push(item: "to")
//stack.push(item: "be")
//stack.push(item: "or")
//print(stack.size())
//print(stack.pop())
//print(stack.pop())
//print(stack.pop())
//print(stack.pop())
//print(stack)
//print()

print("-------------\n---Divider---\n-------------")

//var stack: StackAPI = LinkedListStack()
//stack.push(item: "to")
//stack.push(item: "be")
//stack.push(item: "or")
//print(stack.size())
//print(stack.pop())
//print(stack.pop())
//print(stack.pop())
//print(stack.pop())
//print(stack)
//print()

var queue = LinkedListQueue()
queue.queue(item: "Jarrod")
queue.queue(item:  "Marcel")
queue.queue(item: "Jones")

print(String(reflecting: queue))

//var arrStack = ArrayStack(10)

//print(arrStack)
print(queue)
print("Pop result: \(queue.dequeue())\n")
print("New Head: \(queue.peek())\n")

/// Queue Of Strings
testQueueOfStrings("to be or not to - be -")
