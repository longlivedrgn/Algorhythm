// 파라미터를 count, 모음 갯수, 자음 갯수를 던진다..
// 그리고 모음이 들어있나 계속 확인!

var nums = readLine()!.split(separator: " ").map {Int(String($0))!}
var length = nums[0]
var numbers = nums[1]
var moum = ["a", "e", "i", "o", "u"]
var letters = readLine()!.split(separator: " ").map {String($0)}
letters.sort()
var selected = [String]()

func DFS(start: Int, moumCount: Int, jaumCount: Int) {
    if selected.count > length {
        return
    }
    if selected.count == length && moumCount > 0 && jaumCount > 1{
        print(selected.joined(separator: ""))
        return
    }

    for i in start..<numbers {
        selected.append(letters[i])
        if moum.contains(letters[i]) {
            DFS(start: i+1, moumCount: moumCount+1, jaumCount: jaumCount)
        } else {
            DFS(start: i+1, moumCount: moumCount, jaumCount: jaumCount+1)
        }
        selected.removeLast()
    }
}

DFS(start: 0, moumCount: 0, jaumCount: 0)