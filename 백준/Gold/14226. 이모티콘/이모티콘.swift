let num = Int(String(readLine()!))!
var visited = Array(repeating: Array(repeating: false, count: 2000), count: 2000)
// 현재 바탕화면, 클립보드, 초(소요시간)
var queue: [(Int, Int, Int)] = []

visited[1][0] = true
func bfs(_ start: (Int, Int, Int)){
    queue.append(start)
    while !queue.isEmpty{
        let popped = queue.removeFirst()
        if popped.0 == num {
            print(popped.2)
            break
        }
        if popped.0 >= 1 && popped.0 < 2000{
            if !visited[popped.0][popped.0]{
                visited[popped.0][popped.0] = true
                queue.append((popped.0,popped.0,popped.2 + 1))
            }

            if !visited[popped.0 - 1][popped.1]{
                visited[popped.0 - 1][popped.1] = true
                queue.append((popped.0 - 1, popped.1, popped.2 + 1))
            }
        }

        if popped.1 > 0 && popped.0 + popped.1 < 2000{
            if !visited[popped.0 + popped.1][popped.1]{
                visited[popped.0 + popped.1][popped.1] = true
                queue.append((popped.0 + popped.1, popped.1, popped.2 + 1))
            }
        }


    }


}
bfs((1, 0, 0))