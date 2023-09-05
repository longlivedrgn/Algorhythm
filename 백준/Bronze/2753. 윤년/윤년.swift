var num = Int(readLine()!)!
var isYoon = false
if num % 4 == 0 && num % 100 != 0 {
    isYoon = true
}

if num % 400 == 0 {
    isYoon = true
}

print(isYoon == true ? 1 : 0)