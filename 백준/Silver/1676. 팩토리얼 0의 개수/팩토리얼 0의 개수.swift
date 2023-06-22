var num = Int(readLine()!)!
// 10의 갯수를 찾자! -> 2 * 5의 갯수를 찾아야된다.
// 근데 거의 5의 갯수가 2의 갯수보다 작으므로 5의 갯수를 세자!
var count = 0
if num == 0 {
    print(0)
} else {
    for i in 1...num {
        var value = i
        while value % 5 == 0 {
            count += 1
            value = value / 5
        }
    }
    print(count)
}