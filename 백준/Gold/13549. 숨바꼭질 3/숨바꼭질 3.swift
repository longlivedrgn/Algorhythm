import Foundation

struct Queue<T> {
    var inputStack = [T]()
    var outputStack = [T]()

    mutating func append(_ x: T) {
        inputStack.append(x)
    }

    mutating func pop() -> T? {
        var top: T?
        if outputStack.isEmpty {
            outputStack = inputStack.reversed()
            inputStack.removeAll()
            top = outputStack.popLast()
        }
        else {
            top = outputStack.popLast()
        }
        return top
    }

    mutating func head() -> T? {
        if outputStack.isEmpty {
            outputStack = inputStack.reversed()
            inputStack.removeAll()
        }
        return outputStack.isEmpty ? nil : outputStack[outputStack.endIndex-1]
    }

    func isEmpty() -> Bool {
        return inputStack.isEmpty && outputStack.isEmpty ? true : false
    }
}

var nums = readLine()!.split(separator: " ").map {Int(String($0))!}

var subin = nums[0]
var brother = nums[1]

var count = Array(repeating: 0, count: 100001)
var visited = Array(repeating: false, count: 100001)

var queue = Queue<Int>()
queue.append(subin)
visited[subin] = true

while !queue.isEmpty() {
    let popped = queue.pop()!
    if popped == brother {
        print(count[popped])
        break
    }

    if 0 <= (popped-1) && (popped-1) <= 100000 {
        if !visited[popped-1] {
            visited[popped-1] = true
            queue.append(popped-1)
            count[popped-1] = count[popped] + 1
        } else {
            if count[popped-1] > count[popped] + 1 {
                count[popped-1] = count[popped] + 1
                queue.append(popped-1)
            }
        }
    }

    if 0 <= (popped+1) && (popped+1) <= 100000{
        if !visited[popped+1] {
            visited[popped+1] = true
            queue.append(popped+1)
            count[popped+1] = count[popped] + 1
        } else {
            if count[popped+1] > count[popped] + 1 {
                count[popped+1] = count[popped] + 1
                queue.append(popped+1)
            }
        }

    }

    if 0 <= (popped*2) && (popped*2) <= 100000 {
        if !visited[popped*2] {
            visited[popped*2] = true
            queue.append(popped*2)
            count[popped*2] = count[popped]
        } else {
            if count[popped*2] > count[popped] {
                count[popped*2] = count[popped]
                queue.append(popped*2)
            }
        }

    }
}