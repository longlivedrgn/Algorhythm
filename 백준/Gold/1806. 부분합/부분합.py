N, K = map(int, input().split())
numbers = list(map(int, input().split()))
answer = int(1e9)
head = 0
tail = 0
temp_sum = 0

while True:
    if temp_sum >= K:
        answer = min(answer, tail-head)
        temp_sum -= numbers[head]
        head += 1
    elif tail == N:
        break
    else:
        temp_sum += numbers[tail]
        tail += 1

if answer == int(1e9):
    print(0)
else:
    print(answer)

