var nums = readLine()!.split(separator: " ").map {Int(String($0))!}
var selected = [Int]()

func DFS(start: Int) {
    if selected.count == nums[1] {
        print(selected.map { String($0) }.joined(separator: " "))
        return
    }

    for num in start..<nums[0]+1 {
        if !selected.contains(num) {
            selected.append(num)
            DFS(start: num+1)
            selected.removeLast()
        }
    }
}

DFS(start: 1)
