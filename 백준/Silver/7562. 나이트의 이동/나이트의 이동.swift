var input = Int(readLine()!)!
let dx = [-1, 1, 2, 2, 1, -1, -2, -2]
let dy = [2, 2, 1, -1, -2, -2, -1, 1]

for _ in 0..<input {
    var number = Int(readLine()!)!
    var board = Array(repeating: Array(repeating: 0, count: number), count: number)
    var start = readLine()!.split(separator: " ").map {Int(String($0))!}
    var destination = readLine()!.split(separator: " ").map {Int(String($0))!}
    var queue: Queue<[Int]> = Queue([])
    queue.push(start)
    var count = -1
    var isArrived = false

    while !isArrived {
        count += 1
        for _ in 0..<queue.count {
            let current = queue.pop()!
            if current == destination {
                print(count)
                isArrived = true
                break
            }
            for m in 0..<dx.count {
                let newDx = current[0] + dx[m]
                let newDy = current[1] + dy[m]

                if newDx >= 0 && newDy >= 0 && newDx < number && newDy < number {
                    if board[newDx][newDy] == 0 {
                        board[newDx][newDy] = 1
                        queue.push([newDx, newDy])
                    }
                }
            }
        }
    }

}

class Queue<T>{
    var enqueue: [T]
    var dequeue: [T] = []

    var isEmpty: Bool{
        return enqueue.isEmpty && dequeue.isEmpty
    }
    var count: Int{
        return enqueue.count + dequeue.count
    }

    init(_ queue:[T]){
        self.enqueue = queue
    }

    func push(_ n: T){
        enqueue.append(n)
    }

    func pop() -> T?{
        if dequeue.isEmpty{
            dequeue = enqueue.reversed()
            enqueue.removeAll()
        }
        return dequeue.popLast()
    }

}