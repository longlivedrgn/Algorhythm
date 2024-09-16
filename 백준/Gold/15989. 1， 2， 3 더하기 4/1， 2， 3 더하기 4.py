number_count = int(input())

# 먼저 1로는 모든 숫자를 만들 수 있다. -> 그래서 일단 1로 초기화를 해준다.
dp = [1] * 10001

# 2를 더해서 만들 수 있는 것들!
for i in range(2, 10001):
    dp[i] += dp[i-2]

# 3을 더해서 만들 수 있는 것들!
for i in range(3, 10001):
    dp[i] += dp[i-3]

for _ in range(number_count):
    print(dp[int(input())])



