var nums = readLine()!.split(separator: " ").map {Int(String($0))!}
var numbers = readLine()!.split(separator: " ").map {Int(String($0))!}
numbers.sort()
var selected = [Int]()
var answer = ""

func DFS() {
    if selected.count == nums[1] {
        answer += selected.map { String($0) }.joined(separator: " ") + "\n"
        return
    }
    for num in 0..<nums[0] {
        if !selected.contains(numbers[num]){
            selected.append(numbers[num])
            DFS()
            selected.removeLast()
        }
    }
}

DFS()
print(answer)