var nums = readLine()!.split(separator: " ").map {Int(String($0))!}
var selected = [Int]()
var answer = ""

func DFS() {
    if selected.count == nums[1] {
        answer += selected.map { String($0) }.joined(separator: " ") + "\n"
        return
    }
    for num in 1..<nums[0]+1 {
        selected.append(num)
        DFS()
        selected.removeLast()
    }
}

DFS()
print(answer)