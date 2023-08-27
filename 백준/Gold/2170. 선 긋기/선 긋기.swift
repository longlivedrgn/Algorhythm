
 import Foundation

// 라이노님의 FileIO
final class FileIO {
    private var buffer:[UInt8]
    private var index: Int

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
        index = 0
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }

        return buffer.withUnsafeBufferPointer { $0[index] }
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45{ isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }

    @inline(__always) func readString() -> String {
        var str = ""
        var now = read()

        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시

        while now != 10
                && now != 32 && now != 0 {
            str += String(bytes: [now], encoding: .ascii)!
            now = read()
        }

        return str
    }
}
let file = FileIO()
let num = file.readInt()
var lines = [[Int]]()
for _ in 0..<num {
    let first = file.readInt()
    let second = file.readInt()
    lines.append([first, second])
}

lines.sort { first, second in
    if first[0] != second[0] {
        return first[0] < second[0]
    } else {
        return first[1] < second[1]
    }
}
var result = [[Int]]()
result.append(lines[0])

var answer = 0
for index in 1..<num {
    let popped = result[0]
    if popped[1] >= lines[index][0] && popped[1] <= lines[index][1] {
//        result.append([popped[0], lines[index][1]])
        result[0] = [popped[0], lines[index][1]]
    } else if popped[1] >= lines[index][0] && popped[1] > lines[index][1] {
        continue
    } else {
        answer += popped[1] - popped[0]
        result[0] = lines[index]
//        result.append(lines[index])
    }
}

answer += result[0][1] - result[0][0]
print(answer)
