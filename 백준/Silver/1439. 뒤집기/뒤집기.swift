var num = readLine()!
var oneCount = 0
var zeroCount = 0
var current: Character = "a"

for each in num {
    if current != each {
        if each == "0" {
            zeroCount += 1
            current = "0"
        } else {
            oneCount += 1
            current = "1"
        }
    }
}
print(min(zeroCount, oneCount))