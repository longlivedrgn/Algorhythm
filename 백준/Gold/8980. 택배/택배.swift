var nums = readLine()!.split(separator: " ").map {Int(String($0))!}
var townCount = nums[0]
var limitWeight = nums[1]
var routeCount = Int(readLine()!)!
var route = [[Int]]() // 해당 마을을 지나갈 때 싣고 있는 짐의 양!

for _ in 0..<routeCount {
    route.append(readLine()!.split(separator: " ").map {Int(String($0))!})
}

route.sort {
    if $0[1] != $1[1] {
        return $0[1] < $1[1] // 도착 마을 기준으로 정렬하기
    }
    else {
        return $0[0] < $1[0] // 도착 마을이 같으면 출발 마을 기준으로 정렬하기
    }
}

var answer = 0
var currentWeightInTown = Array(repeating: 0, count: townCount+1)

for i in 0..<routeCount {
    // 현재 트럭이 가지고 갈 수 있는 양을 체크해야된다.
    let maxWeightInRoute = currentWeightInTown[route[i][0]...route[i][1]-1].max()! // 트럭이 지나가야하는 루트 중에서 마을 별로 실어져 있는 짐의 양중에서 max
    // 도착지점에서는 짐을 내리므로 마지막 점은 무게를 체크해주지 않는다.
    if maxWeightInRoute < limitWeight {
        var plus = 0

        if route[i][2] + maxWeightInRoute > limitWeight {
            plus = limitWeight - maxWeightInRoute // 최대 가능 적재량보다 크면, max에서 뺀 만큼만 가져갈 수 있다.
        } else {
            plus = route[i][2]
        }
        answer += plus

        for m in route[i][0]...route[i][1]-1 {
            currentWeightInTown[m] += plus // 현재 택배가 지나가는 마을들에 plus만큼의 택배 양을 추가
            // route[i][0]...route[i][1]-1 기간 동안에는 해당 짐이 트럭을 차지한다.
        }
    }
}

print(answer)