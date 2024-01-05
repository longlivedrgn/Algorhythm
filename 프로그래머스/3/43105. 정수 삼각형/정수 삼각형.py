def solution(triangle):
    numberCount = (len(triangle) *(len(triangle) + 1)) // 2
    dp = [0] * (numberCount +1)
    dp[1] = triangle[0][0]
    index = 1
    for i in range(0, len(triangle)-1): #  (0, 2 )-> 0, 1
        for (idx,angle) in enumerate(triangle[i]): # (0, 7)
            dp[index + len(triangle[i])] = max((dp[index]+triangle[i+1][idx]), dp[index + len(triangle[i])])
            dp[index + len(triangle[i])+1] = max((dp[index]+triangle[i+1][idx+1]), dp[index + len(triangle[i])+1])
            index += 1

    return max(dp)