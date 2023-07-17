var nums = readLine()!.split(separator: " ").map {Int(String($0))!}
var numbers = readLine()!.split(separator: " ").map {Int(String($0))!}
numbers.sort()
var prior = [String]()
var selected = [String]()
var isVisited = Array(repeating: false, count: nums[0])

func DFS(start: Int) {
    if selected.count == nums[1] {
        print(selected.joined(separator: " "))
        return
    }
    var temp = ""
    for num in 0..<nums[0] {
        if isVisited[num] == false && temp != String(numbers[num]) {
            selected.append(String(numbers[num]))
            isVisited[num] = true
            temp = String(numbers[num])
            DFS(start: start+1)
            selected.removeLast()
            isVisited[num] = false
        }
    }
}

DFS(start:0)