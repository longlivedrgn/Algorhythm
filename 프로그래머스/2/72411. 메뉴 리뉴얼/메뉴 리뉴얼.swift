import Foundation

func solution(_ orders:[String], _ course:[Int]) -> [String] {
    var dict = [String: Int]()

    for order in orders {
        var letters = order.map {String($0)}
        let combination = subsets(letters.sorted())
        for com in combination {
            let letterJoined = com.joined()
            let letter = dict[letterJoined]
            if letter == nil {
                dict[letterJoined] = 1
            } else {
                dict[letterJoined]! += 1
            }
        }
    }

    var answers = [String]()
    
    for length in course {
        let temp = dict.filter { $0.key.count == length && $0.value > 1 } // length와 길이와 같고, value가 2보다 큰 놈을 찾아낸다.
        let maxValue = temp.values.max()
        let menu = temp.filter { $0.value == maxValue }.map { $0.key }

        answers.append(contentsOf: menu)
    }

    return answers.sorted()
}

func subsets(_ array: [String]) -> [[String]] {
    var answer: [[String]] = [[]]

    for i in 0..<array.count {
        for m in answer {
            answer.append(m + [array[i]])
        }
    }
    answer.removeFirst()
    return answer
}