import Foundation

struct Queue<T> {
    var inputStack = [T]()
    var outputStack = [T]()

    mutating func append(_ x: T) {
        inputStack.append(x)
    }

    mutating func pop() -> T? {
        var top: T?
        if outputStack.isEmpty {
            outputStack = inputStack.reversed()
            inputStack.removeAll()
            top = outputStack.popLast()
        }
        else {
            top = outputStack.popLast()
        }
        return top
    }

    mutating func head() -> T? {
        if outputStack.isEmpty {
            outputStack = inputStack.reversed()
            inputStack.removeAll()
        }
        return outputStack.isEmpty ? nil : outputStack[outputStack.endIndex-1]
    }

    func isEmpty() -> Bool {
        return inputStack.isEmpty && outputStack.isEmpty ? true : false
    }
}

var flowers = Queue<[Int]>()
var num = Int(readLine()!)!
var tempFlowers = [[Int]]()

// 3월 21일이면 => 321로 만들기
for _ in 0..<num {
    var nums = readLine()!.split(separator: " ").map {Int(String($0))!}
    var tempList = [Int]()
    tempList.append(nums[0]*100+nums[1])
    tempList.append(nums[2]*100+nums[3])
    tempFlowers.append(tempList)
}
// 오름차순으로 소팅하기!!~
tempFlowers.sort { first, second in
    return first[0] < second[0]
}
flowers.inputStack = tempFlowers
var target = 301 // 전체 span의 맨 마지막 날짜를 저장하기
var end = 0 // 임시 end로 설정하기!
var count = 0
var flowerCount = 0

// 모든 꽃들을 비교한다.
while !flowers.isEmpty() {
    if target >= 1201 || target < flowers.head()![0] {
        break
    }

    for _ in 0..<(num-flowerCount) {
        if flowers.head()![0] <= target { // 시작점이 현재 스팬의 맨 마지막 보다 작을 때!
            if flowers.head()![1] >= end {
                end = flowers.head()![1] // end를 갱신하기!... 즉, 최대로 높은 end를 찾아서
            }
            // 매번 flowers의 앞은 제거하기
            flowers.pop()!
            flowerCount += 1
        } else { // 시작점이 현재 스팬의 맨 마지막 보다 크다면 문제가 생긴 것이다!..
            break
        }
    }

    target = end // target으로 갱신한다!..
    count += 1
}

if target < 1201 {
    print(0)
} else {
    print(count)
}