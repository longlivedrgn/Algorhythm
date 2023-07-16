var nums = readLine()!.split(separator: " ").map {Int(String($0))!}
var numbers = readLine()!.split(separator: " ").map {Int(String($0))!}
numbers.sort()
var selected = [Int]()
var answer = ""

func DFS(start: Int) {
    if selected.count == nums[1] {
        answer += selected.map { String($0) }.joined(separator: " ") + "\n"
        return
    }
    for num in start..<nums[0] {
        selected.append(numbers[num])
        DFS(start: num+1)
        selected.removeLast()
    }
}

DFS(start:0)
print(answer)