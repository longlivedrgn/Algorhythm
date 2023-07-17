var nums = readLine()!.split(separator: " ").map {Int(String($0))!}
var numbers = readLine()!.split(separator: " ").map {Int(String($0))!}
numbers.sort()
var selected = [String]()
var answer = ""

func DFS(start: Int) {
    if selected.count == nums[1] {
        answer += selected.joined(separator: " ") + "\n"
        return
    }
    for num in start..<nums[0] {
        selected.append(String(numbers[num]))
        DFS(start: num)
        selected.removeLast()
    }
}

DFS(start:0)
print(answer)