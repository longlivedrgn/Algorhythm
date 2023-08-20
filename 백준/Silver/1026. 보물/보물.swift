var num = Int(readLine()!)!
var arrayA = readLine()!.split(separator: " ").map {Int(String($0))!}
var arrayB = readLine()!.split(separator: " ").map {Int(String($0))!}

arrayA.sort(by: <)
arrayB.sort(by: >)

var result = 0

for m in 0..<num {
    result += arrayA[m] * arrayB[m]
}

print(result)