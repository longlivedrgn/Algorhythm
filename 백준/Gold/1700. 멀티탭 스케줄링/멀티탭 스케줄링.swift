import Foundation

var nums = readLine()!.split(separator: " ").map {Int(String($0))!}
let mutiCount = nums[0]
let useCount = nums[1]
var useCase = readLine()!.split(separator: " ").map {Int(String($0))!}

var powerSockets = [Int]()
var answerCount = 0

for (index, use) in useCase.enumerated() {
    if powerSockets.contains(use) {
        continue
    } else if powerSockets.count < mutiCount {
        powerSockets.append(use)
    } else {
        var offIndex = -1
        var lastUsed = -1
        for (socketIndex, socket) in powerSockets.enumerated() {
            var shouldUsed = -1

            for useIndex in index+1..<useCount {
                if socket == useCase[useIndex] {
                    shouldUsed = useIndex
                    break
                }
            }
            if shouldUsed == -1 {
                offIndex = socketIndex
                break
            } else {
                if shouldUsed > lastUsed {
                    lastUsed = shouldUsed
                    offIndex = socketIndex
                }
            }
        }
        powerSockets[offIndex] = use
        answerCount += 1
    }
}

print(answerCount)