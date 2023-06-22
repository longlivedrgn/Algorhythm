var num = Int(readLine()!)!
var value = 1
if num == 0 {
    print(1)
} else {
    for i in 1...num {
        value = value * i
    }
    print(value)
}