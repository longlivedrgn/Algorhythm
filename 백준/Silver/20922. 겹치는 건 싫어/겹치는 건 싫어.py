from collections import defaultdict

N, K = map(int,input().split())
numbers = list(map(int, input().split()))

dic = defaultdict(int)

answer = 0
start = 0
end = 0

while end < N:
    if dic[numbers[end]] >= K:
        dic[numbers[start]] -= 1
        start += 1
    else:
        dic[numbers[end]] += 1
        end += 1
        answer = max(answer, end - start)
print(answer)
