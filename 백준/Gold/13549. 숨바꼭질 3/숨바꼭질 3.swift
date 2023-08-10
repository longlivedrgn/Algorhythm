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
    let poppped = queue.pop()!
    if poppped == brother {
        print(count[poppped])
        break
    }
    
    if 0 <= (poppped*2) && (poppped*2) <= 100000 && !visited[poppped*2] {
        visited[poppped*2] = true
        queue.append(poppped*2)
        count[poppped*2] = count[poppped]
    }
    
    if 0 <= (poppped-1) && (poppped-1) <= 100000 && !visited[poppped-1] {
        visited[poppped-1] = true
        queue.append(poppped-1)
        count[poppped-1] = count[poppped] + 1
    }

    if 0 <= (poppped+1) && (poppped+1) <= 100000 && !visited[poppped+1] {
        visited[poppped+1] = true
        queue.append(poppped+1)
        count[poppped+1] = count[poppped] + 1
    }


}