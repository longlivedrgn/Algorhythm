import Foundation

func solution(_ clothes:[[String]]) -> Int {
    // 일단 Dictionary에 넣고 그 다음에 조합의 갯수를 구하기!...
    var dict = [String: Int]()
    for pair in clothes {
        // 먼저 있는 지 확인하기!..
        // 있으면 +1을 하고
        if dict[pair[1]] != nil {
            dict[pair[1]]! += 1
            // 없으면 1로 초기화하기
        } else {
            dict[pair[1]] = 1
        }
    }
    var count = 1
    for (ken, value) in dict {
        count *= (value+1)
    }
    
    return count - 1
}