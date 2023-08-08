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


var num = Int(readLine()!)!
var visited = Array(repeating: Array(repeating: false, count: 2001), count: 2001)
// 현재 바탕화면, 클립보드, 초(소요시간)
var queue = Queue<(Int, Int, Int)>()

// 처음 시작할 때 바탕화면에 한 개의 임티는 존재
// 따라서 바탕하면에는 한 개, 클립보드에는 0개는 방문했다고 가정!
visited[1][0] = true

queue.append((1,0,0))
while !queue.isEmpty() {
    let popped = queue.pop()!
    if popped.0 == num {
        print(popped.2)
        break
    }

    if popped.0 > 0 {
        // 바탕화면에서 하나 빼기
        if !visited[popped.0-1][popped.1] {
            visited[popped.0-1][popped.1] = true
            queue.append((popped.0-1, popped.1, popped.2+1))
        }
    }

    // 바탕화면에 있는 이모티콘 클립보드로 복사하기
    if !visited[popped.0][popped.0] {
        visited[popped.0][popped.0] = true
        queue.append((popped.0, popped.0, popped.2+1))
    }

    if popped.1 > 0 && popped.0+popped.1 <= 2000 {
        if !visited[popped.0 + popped.1][popped.1] {
            visited[popped.0 + popped.1][popped.1] = true
            queue.append((popped.0 + popped.1, popped.1, popped.2 + 1))
        }
    }
}