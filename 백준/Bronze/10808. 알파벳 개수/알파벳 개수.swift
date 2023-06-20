var statement = readLine()!
var result = [Int](repeating: 0, count: 26)

for char in statement {
    result[Int(char.asciiValue!) - 97] += 1
}

print(result.map { String($0) }.joined(separator: " "))