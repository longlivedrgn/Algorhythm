number = int(input())
numbers = [0]
for _ in range(number):
    numbers.append(int(input()))
dp = [1 for _ in range(number)]
dp.append(1)

for i in range(1, number+1):
    for j in range(1, i+1):
        if numbers[i] > numbers[j]:
            dp[i] = max(dp[j]+1, dp[i])
print(number-max(dp))