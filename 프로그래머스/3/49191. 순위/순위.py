def solution(n, results):
    answer = 0
    # 플로이드 워셜 정리를 활용한다.
    graph = [[0] * (n+1) for _ in range(n+1)]

    for result in results:
        graph[result[0]][result[1]] = 1
        graph[result[1]][result[0]] = -1

    for k in range(n+1):
        for r in range(n+1):
            for c in range(n+1):
                if graph[c][k] == 1 and graph[k][r] == 1:
                    graph[c][r] = 1
                    graph[k][c] = -1
                    graph[r][k] = -1
                    graph[r][c] = -1
    for row in graph:
        if row.count(0) == 2: # 자기자신인 을 빼야된다.
            answer += 1

    return answer
