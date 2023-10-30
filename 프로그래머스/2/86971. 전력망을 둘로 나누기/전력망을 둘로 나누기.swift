import Foundation

func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    // 가장 먼저 배열 중 한개씩 딱 빼서 해당 배열로 계산하기
    // 1: [3], 2: [3].. 이런 식으로 구현하기
    // [[3], [3], [2, 4]] 이렇게!..
    // 그래서 전체를 순회한다... 그래서 visited된 갯수를 구하고, 그걸 전체의 갯수에서 배면
    // 다른 트리가 나오게 된다!..
    // 그 두 개를 서로 빼면 답이다.
    var answer = Int.max
    
    for i in 0..<wires.count {
        var tree = wires
        var treeArray = Array(repeating: [Int](), count: n+1)
        tree.remove(at: i)
        
        for leaf in tree {
            // treeArray에 채워넣기
            treeArray[leaf[0]].append(leaf[1])
            treeArray[leaf[1]].append(leaf[0])
        }
        var visited = Array(repeating: false, count: n+1)
        var count = 0
        visited[1] = true
        
        func BFS(start: Int) {
            for temp in treeArray[start] {
                if visited[temp] == false {
                    visited[temp] = true
                    count += 1
                    BFS(start: temp)
                    }
                }
        }

        BFS(start: 1) 
        let anotherTreeCount = wires.count - count - 1
        let tempAnswer = abs(anotherTreeCount - count)
        if tempAnswer < answer {
            answer = tempAnswer
        }
    }
    return answer
}

