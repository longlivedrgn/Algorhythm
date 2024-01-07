def solution(m, n, puddles):
    # 오른쪽과 아래로 가는 방향을 활용할 경우, 도착지점에 가는 경우는 싹 다 최단 거리이다...
    # 해당 위치까지 가는 데 생기는 경로의 수
    
    # 왼쪽, 위쪽에 padding을 넣는 스킬!...
    dp = [[0 for _ in range(m+1)] for _ in range(n+1)]
    dp[1][1] = 1

    for s, t in puddles:
        dp[t][s] = -1

    for i in range(1, n+1):
        for j in range(1, m+1):
            if i == 1 and j == 1: # 이걸 안하면 바로 (1,1)이 0으로 바뀐다..
                continue
            if dp[i][j] == -1:
                dp[i][j] = 0
            else:
                dp[i][j] = (dp[i][j-1] + dp[i-1][j]) % 1000000007

    return dp[n][m]