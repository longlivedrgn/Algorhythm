let n = Int(String(readLine()!))!
//화면, 클립보드, 시간
var queue: [(Int, Int, Int)] = []
var visited = Array(repeating: Array(repeating: false, count: 2000), count: 2000)

visited[1][0] = true
queue.append((1, 0, 0))
while !queue.isEmpty{
    let pop = queue.removeFirst()
    if pop.0 == n {
        print(pop.2)
        break
    }
    if pop.0 >= 1 && pop.0 < 2000{
        if !visited[pop.0][pop.0]{
            visited[pop.0][pop.0] = true
            queue.append((pop.0,pop.0,pop.2 + 1))
        }

        if !visited[pop.0 - 1][pop.1]{
            visited[pop.0 - 1][pop.1] = true
            queue.append((pop.0 - 1, pop.1, pop.2 + 1))
        }
    }

    if pop.1 > 0 && pop.0 + pop.1 < 2000{
        if !visited[pop.0 + pop.1][pop.1]{
            visited[pop.0 + pop.1][pop.1] = true
            queue.append((pop.0 + pop.1, pop.1, pop.2 + 1))
        }
    }


}