def solution(n, s, a, b, fares):
    answer = 987654321
    cost = [[987654321 for _ in range(n + 1)] for _ in range(n + 1)]

    # 주어진 정보로 일단 cost 표를 채우기!
    for fare in fares:
        cost[fare[0]][fare[1]] = fare[2]
        cost[fare[1]][fare[0]] = fare[2]  # 양방향으로 채우기
    
    # 플로이드 워셜 공식 활용하기
    for i in range(1, n + 1):
        for t in range(1, n + 1):
            for k in range(1, n + 1):
                if t == k:
                    cost[t][k] = 0
                else:
                    cost[t][k] = min(cost[t][i] + cost[i][k], cost[t][k])

    for i in range(1, n + 1):
        answer = min(cost[s][i] + cost[i][a] + cost[i][b], answer)

    return answer