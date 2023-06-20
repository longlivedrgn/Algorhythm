var statement = readLine()!
var result = [Int](repeating: -1, count: 26)

for (inx, char) in statement.enumerated() {
    let value =  result[Int(char.asciiValue!) - 97]
    if value == -1 {
        result[Int(char.asciiValue!) - 97] = inx
    }
}

print(result.map { String($0) }.joined(separator: " "))