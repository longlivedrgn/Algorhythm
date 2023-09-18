var numberCount = Int(readLine()!)! // 주어진 숫자 갯수
var nums = readLine()!.split(separator: " ").map {Int(String($0))!}
var operatorCounts = readLine()!.split(separator: " ").map {Int(String($0))!}
var selected = Array(repeating: false, count: numberCount)
var result = Array(repeating: 0, count: numberCount)

var maxValue = Int.min
var minValue = Int.max


func DFS(depth: Int, calculatedValue: Int) {
    if depth == numberCount {
        maxValue = max(maxValue, calculatedValue)
        minValue = min(minValue, calculatedValue)
        return
    }

    for i in 0..<4 { // 연산자 순회하기
        if operatorCounts[i] == 0 { // 만약 operatorCount가 0이면 다른 연산자로 넘어가기
            continue
        }

        operatorCounts[i] -= 1

        if i == 0 {
            DFS(depth: depth+1, calculatedValue: calculatedValue + nums[depth])
        } else if i == 1 {
            DFS(depth: depth+1, calculatedValue: calculatedValue - nums[depth])
        } else if i == 2 {
            DFS(depth: depth+1, calculatedValue: calculatedValue * nums[depth])
        } else {
            DFS(depth: depth+1, calculatedValue: calculatedValue / nums[depth])
        }
        operatorCounts[i] += 1
    }
}


DFS(depth: 1, calculatedValue: nums[0])
print(maxValue)
print(minValue)