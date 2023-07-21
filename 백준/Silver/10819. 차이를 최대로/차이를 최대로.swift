var number = Int(readLine()!)!
var nums = readLine()!.split(separator: " ").map {Int(String($0))!}
var visited = Array(repeating: false, count: number)
var selected = [Int]()
var max = 0
// depth가 길이가되면 return하게 하기
// 그리고 visited를 활용해서 갔던 곳은 또 안가게 설정하기!

func dfs(depth: Int) {
    if depth == number {
        var sum: Int = 0
        for m in 0..<(number-1) {
            sum += abs(selected[m] - selected[m+1])
        }
        if max < sum {
            max = sum
        }
        return
    }

    for indx in 0..<number {
        if visited[indx] == false {
            visited[indx] = true
            selected.append(nums[indx])
            dfs(depth: depth+1)
            visited[indx] = false
            selected.removeLast()
        }
    }
}

dfs(depth: 0)
print(max)