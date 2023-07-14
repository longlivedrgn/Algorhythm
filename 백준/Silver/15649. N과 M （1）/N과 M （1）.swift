var nums = readLine()!.split(separator: " ").map {Int(String($0))!}
var numberList = [Int]()
var visited = [Int]()
var selected = [Int]()

for _ in 0..<nums[1] {
    selected.append(0)
}

for _ in 0..<nums[0] {
    visited.append(0)
}

for i in 1...nums[0] {
    numberList.append(i)
}

func DFS(depth: Int) {
    if depth == nums[1] {
        for m in selected {
            print(m, terminator: " ")
        }
        print("")
        return
    }

    for k in 0..<nums[0] {
        if visited[k] != 1 {
            visited[k] = 1
            selected[depth] = numberList[k]
            DFS(depth: depth+1)
            visited[k] = 0
        }
    }
}

DFS(depth: 0)