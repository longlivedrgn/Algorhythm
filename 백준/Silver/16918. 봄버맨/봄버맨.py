R, C, N = map(int, input().split())

zeros = []
graph = []
for r in range(R):
    row = list(input())
    graph.append(row)

dr = [-1, 1, 0, 0]
dc = [0, 0, -1, 1]

if N == 1:
    for m in graph:
        print("".join(m))
else:

    count = 1
    zeros = [] # bomb을 저장하기
    for r in range(R):
        for c in range(C):
            if graph[r][c] == "O":
                zeros.append([r, c])

    count += 1

    while count != N+1:
        if count % 2 == 0:
            graph = [["O" for _ in range(C)] for _ in range(R)]
        else:
            for zero in zeros:
                zero_r = zero[0]
                zero_c = zero[1]
                graph[zero_r][zero_c] = "."
                for i in range(4):
                    next_r = zero_r + dr[i]
                    next_c = zero_c + dc[i]

                    if 0 <= next_c < C and 0 <= next_r < R:
                        graph[next_r][next_c] = "."
            # 다시 zero 수집하기
            zeros = []
            for r in range(R):
                for c in range(C):
                    if graph[r][c] == "O":
                        zeros.append([r, c])
        count += 1

    for m in graph:
        print("".join(m))