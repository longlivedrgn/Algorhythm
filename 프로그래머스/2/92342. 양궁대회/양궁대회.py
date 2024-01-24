def solution(n, info):
    answer = []
    ryan = [0] * 11
    gap = 0

    def DFS(arrowsNumber, now):
        nonlocal answer, ryan, gap

        if arrowsNumber == n:
            # 이러면 이제 갯수 세기 시작!..
            # 현재 ryan과 info를 비교한다!..
            ryanSum = 0
            apeachSum = 0

            for t in range(11):
                if ryan[t] > info[t]:
                    ryanSum += 10 - t
                elif ryan[t] <= info[t] and info[t] != 0:
                    apeachSum += 10 - t

            # Sum을 구했다면, gap을 체크한다.
            if ryanSum > apeachSum:
                # 저장된 격차보다 새로운 격차가 더 크다면 바꿔준다. 
                if ryanSum - apeachSum > gap:
                    gap = ryanSum - apeachSum
                    # answer를 ryan 과녘으로 바꿔주기!..
                    answer = ryan[:]

                # 만약 격차가 똑같다면?.. -> 가장 적은 점수의 과녘 수가 많은 것을 선택한다!..
                # 뒤에서부터 체크한다.
                if ryanSum - apeachSum == gap:
                    for m in range(10, -1, -1):
                        if ryan[m] > answer[m]:
                            answer = ryan[:]
                            break
                        if ryan[m] < answer[m]:
                            break
            return 
        for i in range(now, 11):
            ryan[i] += 1  # 해당 과녁에 화살 빵 찍기
            DFS(arrowsNumber + 1, i)
            ryan[i] -= 1  # 나오면서 화살 하나 빼기

    DFS(0, 0)

    if answer == []: # answer를 갱신하지 못했다면?
        return [-1]
    else:
        return answer