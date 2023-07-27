var input = Int(readLine()!)!
var buthunghos = readLine()!.split(separator: " ").map {String($0)}
var first: Int = 0 // 최소
var last: Int = 0// 최대

var numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
var visited = Array(repeating: false, count: 10)
var selected = [Int]()
var result = [String]()

func DFS(depth: Int, now: Int) {

    if depth > 1 {
        if buthunghos[depth-2] == "<" {
            if selected[depth-2] > now {
                return
            }
        } else {
            if selected[depth-2] < now {
                return
            }
        }
    }

    if depth == (input+1) {
        result.append(selected.map { String($0) }.joined())
        return
    }

    for m in 0..<10{
        if !visited[m] {
            visited[m] = true
            selected.append(numbers[m])
            DFS(depth: depth+1, now: numbers[m])
            visited[m] = false
            selected.removeLast()
        }
    }
}

DFS(depth: 0, now: 0)
print(result.max()!)
print(result.min()!)
