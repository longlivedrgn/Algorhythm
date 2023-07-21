var number = Int(readLine()!)!
var nums = Array(1...number)
var visited = Array(repeating: false, count: number)
var selected = [String]()
// depth가 길이가되면 return하게 하기
// 그리고 visited를 활용해서 갔던 곳은 또 안가게 설정하기!

func dfs(depth: Int) {
    if depth == number {
        print(selected.joined(separator: " "))
        return
    }

    for indx in 0..<number {
        if visited[indx] == false {
            visited[indx] = true
            selected.append(String(nums[indx]))
            dfs(depth: depth+1)
            visited[indx] = false
            selected.removeLast()
        }
    }
}

dfs(depth: 0)