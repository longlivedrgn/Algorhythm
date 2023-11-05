import Foundation

func solution(_ name:String) -> Int {
    let alphabets: [String: Int] = ["A": 0, "B":1, "C":2, "D":3, "E": 4, "F": 5, "G": 6, "H": 7, "I":8, "J":9, "K":10, "L":11, "M":12, "N":13, "O": 12, "P":11, "Q": 10, "R": 9, "S": 8, "T": 7, "U": 6, "V": 5, "W": 4, "X": 3, "Y": 2, "Z": 1]
    var result = 0
    var minimumMove = name.count - 1 // 왼쪽으로 오른쪽으로 쭉 갔을 때로 먼저 해놓기!.. -> 이게 최대일 거니까!

    let arr = name.map { String($0) } // ["J", "E",... ] 형식으로 만들기!

    for (index, letter) in arr.enumerated() {
        result += alphabets[letter]! // A에서 움직이는 거는 바로 더하기
        // 연속되는 A 갯수 구하기!
        var nextIndex = index + 1 
        
        // "A"가 끝날 때까지 계속 nextIndex를 구하기!
        while nextIndex < name.count && arr[nextIndex] == "A" {
            nextIndex += 1
        }
        
        // 스트레이트로 가는 것이 빠른지, 왼쪽 -> 오른쪽 -> 왼쪽 쭉! 이 빠른지, 오른쪽 -> 왼쪽 -> 오른쪽 쭉!.. 이 빠른 지가 제일 중요하다.
        // BBBAAABB
        // index는 BBB까지 가는 것!
        // 근데 B->B->B, 가고 다시 돌아가기 B <- B <- B, 따라서 index를 두번 더한다.
        // 그리고 B(처음)->B -> B까지 가는 거 = name.count - nextIndex
        
        minimumMove = min(minimumMove, index + index + name.count - nextIndex, index + (name.count - nextIndex)*2)
    }
    result += minimumMove
    return result
}