// 먼저 홀수이면 -1을 해서 -2로 나누어서 몫을 다시 넣기! -> 나머지는 리스트에 append
// 근데 -1해서 0이면 그냥 리스트에 1을 넣고 끝내기!
// 만약 짝수이면 그냥 -2로 나눠어서 몫을 다시 넣기!

var num = Int(readLine()!)!
var list = [Int]()
if num == 0 {
    print(0)
} else {
    while num != 0 {
        if abs(num)%2 == 0 { // 짝수라면?
            num = num / (-2)
            list.append(0)
        } else {
            num = (num - 1) / (-2)
            list.append(1)
        }
    }
    var reveresed = list.reversed()
    for i in reveresed {
        print(i, terminator: "")
    }
}