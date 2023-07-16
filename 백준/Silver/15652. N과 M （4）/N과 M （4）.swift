var nums = readLine()!.split(separator: " ").map {Int(String($0))!}
var selected = [Int]()
var answer = ""

func DFS(start: Int) {
    if selected.count == nums[1] {
        answer += selected.map { String($0) }.joined(separator: " ") + "\n"
        return
    }
    for num in start..<nums[0]+1 {
        selected.append(num)
        DFS(start: num)
        selected.removeLast()
    }
}

DFS(start: 1)
print(answer)