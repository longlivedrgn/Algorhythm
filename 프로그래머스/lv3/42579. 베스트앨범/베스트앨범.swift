import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    // 최종 답을 return할 수 있는 array
    var answer = [Int]()
    
    // ["classic": [[0, 500], [2, 150], [3, 800]], "pop": [[1, 600], [4, 2500]]]
    // 위와 같이 dict를 구성하기
    var dict = [String: [[Int]]]()
    
    // dict 채우기!
    for (index, genre) in genres.enumerated() {
        if let _ = dict[genre] {
            dict[genre]?.append([index, plays[index]])
        } else {
            dict[genre] = [[index, plays[index]]]
        }
    }
    
    // 해당 dict에서 소팅이 안되어있다.
    // dict을 values들의 합이 가장 key가 가장 먼저 앞으로 가게 sorting하기
    let filteredDict = dict.sorted { first, second in
        var firstValue = 0
        var secondValue = 0

        for value in first.value { // first.value = [[0, 500], [2, 150], [3, 800]]
            firstValue += value[1]
        }

        for value in second.value {
            secondValue += value[1]
        }

        return firstValue > secondValue
    }

    // 그리고 장르의 종류 갯수만큼 순회하기!..
    for index in 0..<filteredDict.count {
        
        // 각 장르에서 play 수에 맞게 sorting하기!..
        let valuesInIndex = filteredDict[index].value.sorted { first, second in
            return first[1] > second[1]
        }
        
        // 그리고 소팅된 것에서 앞에 두 개를 똑 때와서 asnwer에 넣어주기
        answer.append(valuesInIndex[0][0])
        if valuesInIndex.count > 1 {
            answer.append(valuesInIndex[1][0])
        }
    }

    return answer
}
