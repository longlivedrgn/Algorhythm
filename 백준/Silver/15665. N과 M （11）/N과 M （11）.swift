var nums = readLine()!.split(separator: " ").map {Int(String($0))!}
var numbers = readLine()!.split(separator: " ").map {Int(String($0))!}
// 먼저 sorting하기
numbers.sort()
// 선택된 숫자를 넣는 배열
var selected = [String]()

func DFS(start: Int) {
    if selected.count == nums[1] {
        print(selected.joined(separator: " "))
        return
    }
    var temp = ""
    for num in 0..<nums[0] {
        if temp != String(numbers[num]) {
            selected.append(String(numbers[num]))
            temp = String(numbers[num])
            DFS(start: num+1)
            selected.removeLast()
        }
    }
}

DFS(start:0)