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


var queue = LinkedListQueue()
queue.push(item: "Jarrod")
queue.push(item:  "Marcel")
queue.push(item: "Jones")

print(String(reflecting: queue))

print("Pop result: \(queue.pop())\n")
print("New Head: \(queue.peek())\n")

//print(queue.debugDescription)
