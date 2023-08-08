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
// 그 전 값을 담는 걸로 하자!
var track = Array(repeating: -1, count: 100001)
var dx = [-1, 1, 0]

var queue = Queue<Int>()
queue.append(subin)
while !queue.isEmpty() {
    let popped = queue.pop()!
    if popped == brother {
        print(count[popped])
        break
    }
    for i in dx {
        var newArea: Int
        if i == 0 {
            newArea = popped * 2
        } else {
            newArea = popped + i
        }
        // count[newArea] == 0일때만 해도 되는게!
        // 이미 그전에 0이 바뀌었으면 그 전 depth에서 간거다.
        // 그러면 내가 지금 가서 바꿀 이유가 없다. 왜냐하면 무조건 더 품이 많이 들어갈 거니까!
        // BFS라는 것을 기억하자!.. DFS랑은 다르다!
        // DFS는 이미 방문한 얘가 너 비효율적으로 갔을 수 있다.
        // 그러나 BFS는 동일한 depth부터 훑기에 먼저 가는 놈이 비효율적일 수가 없다.
        if 0<=newArea && newArea <= 100000 && count[newArea] == 0 {
            count[newArea] = count[popped] + 1 // newArea가는 한번의 품이 들어가므로!
            track[newArea] = popped
            queue.append(newArea)
        }
    }
}

var result = [Int]()
//result.append(subin)
var index = brother
while index != subin {
    result.append(index)
    index = track[index]
}
result.append(subin)
result.reverse()
print(result.map{ String($0)}.joined(separator: " "))