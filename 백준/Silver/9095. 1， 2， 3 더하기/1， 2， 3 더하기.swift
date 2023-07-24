var input = Int(readLine()!)!
var numbers = [1, 2, 3]
var count = 0

func DFS(sum: Int, goal: Int) {
    if sum > goal {
        return
    }
    if goal == sum {
        count += 1
        return
    }
    for i in 0...2 {
        DFS(sum: sum+numbers[i], goal: goal)
    }
}



for _ in 0..<input {
    var num = Int(readLine()!)!
    DFS(sum: 0, goal: num)
    print(count)
    count = 0
}