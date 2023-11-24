
func solution(_ play_time:String, _ adv_time:String, _ logs:[String]) -> String {

    // 그냥 시간이 같으면 바로 "00:00:00" return하기
    if play_time == adv_time {
        return "00:00:00"
    }

    let playTimeSeconds = makeSeconds(time: play_time) // 총 플레이 시간을 초로 바꾸기

    // Int로 할 경우, Int의 최대 값에서 나가리가 될 수 있다. -> Double로 구현해준다.
    // 배열 만들어주기
    // 총 재생시간이 1시간 11분 11초 이라면 4271초이므로 [0,0,0,0,0.....] 4272개 길이의 배열을 만들어줌.
    var allPlaySeconds:[Double] = Array(repeating: 0, count: playTimeSeconds+1)

    // 광고 시간도 초로 바꿔준다.
    let advTimeSeconds = makeSeconds(time: adv_time)

    for log in logs {
        let startEnd = splitPlaytime(playtime: log) // ("01:20:15", "01:45:14") 로 일단 나누기
        let start = makeSeconds(time: startEnd.0) // 그리고 초로 만들어버리기
        let end = makeSeconds(time: startEnd.1)
        allPlaySeconds[start] += 1 // 그리고 내가 시작하는 곳에 +1 하기
        allPlaySeconds[end] -= 1 // 내가 끝나는 곳에 -1하기
    }

    // [0,0,1,1,0,0,0-1,0,0,-1] 이걸
    // [0,0,1,2,2,2,2,1,1,1,0] 이렇게 구현한다.
    // 즉, 내 앞에 있는 값과 내 값을 더해서 현재 내 값으로 업데이트한다.
    // 이러면 현재 초에서 몇명이나 보고있는 지 숫자로써 나오게 된다.
    for i in 1..<playTimeSeconds {
        allPlaySeconds[i] += allPlaySeconds[i-1]
    }

    // 일단 0초부터 시작했을 때에 광고시간동안 몇명이 보는 지를 확인한다.
    var sum = allPlaySeconds[0..<advTimeSeconds].reduce(0,+)

    var maxSum:Double = sum // 그리고 그걸 최대 sum으로 업데이트한다.

    var maxStart:Int = 0 // 처음 시작은 0으로 해놓는다.


    // 여기서 allPlaySeconds는 각 초마다 몇명이 보고있는 지 알 수 있는 배열이다!..
    /*
     0초부터 광고시간까지 , 1초부터 광고시간+1까지,2초부터 광고시간 +2까지....이렇게 플레이시간까지의 합을 구해나가다 보면

     가장 합이 높은 구간을 찾을 수 있습니다.

     효율성을 위해선 모든 합을 구할 필요없이 구해져있는 합에서 가장 첫번째를 빼주고 가장 마지막의 + 1번째 값을 더해주기만 하면 됩니다.
     */
    for i in advTimeSeconds...playTimeSeconds {

        // 구해져있는 합에서 가장 첫번 째꺼를 빼주고, 가장 마지막 바로 뒤에 있는 값을 +1 해준다.
        sum += allPlaySeconds[i] - allPlaySeconds[i - advTimeSeconds]
        
        // 만약 더 큰 값이 나오게된다면?...
        if maxSum < sum {
            maxSum = sum // 업데이트하기!
            maxStart = i - advTimeSeconds + 1
        }
    }
    return makeSecondsToString(seconds: maxStart)
}

func makeSecondsToString(seconds:Int) -> String {
    let hourString = 0...9 ~= seconds/3600 ? "0\(seconds/3600)" : "\(seconds/3600)"
    let minuteString = 0...9 ~= seconds/60%60 ? "0\(seconds/60%60)" : "\(seconds/60%60)"
    let secondString = 0...9 ~= seconds%60 ? "0\(seconds%60)" : "\(seconds%60)"

    return "\(hourString):\(minuteString):\(secondString)"
}

// 주어진 값을 초 값으로 바꾸기!..
func makeSeconds(time:String) -> Int {
    let split = time.components(separatedBy: ":")
    let hour = Int(split[0])! * 60 * 60
    let minute = Int(split[1])! * 60
    let second = Int(split[2])!

    return hour + minute + second
}

func splitPlaytime(playtime:String) -> (String,String) {
    let playtimeSplit = playtime.components(separatedBy: "-")
    let start = playtimeSplit[0]
    let end = playtimeSplit[1]

    return (start,end)
}