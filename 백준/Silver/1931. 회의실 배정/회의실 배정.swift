
var num = Int(readLine()!)!
var rooms = [[Int]]()

for _ in 0..<num {
    var nums = readLine()!.split(separator: " ").map {Int(String($0))!}
    rooms.append(nums)
}

rooms.sort { first, second in
    if first[1] == second[1] {
        return first[0] < second[1]
    } else {
        return first[1] < second[1]
    }
}

var count = 1
var finishTime = rooms[0][1]

for (index, value) in rooms.enumerated() {
    if index == 0 {
        continue
    }
    if value[0] >= finishTime {
        finishTime = value[1]
        count += 1
    }
}

print(count)