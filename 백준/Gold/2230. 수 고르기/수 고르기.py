n, m = map(int, input().split())
numbers = []
for _ in range(n):
    numbers.append(int(input()))

numbers.sort()
answer = 10987654321
for i in range(n):
    for j in range(i, n):
        gap = numbers[j] - numbers[i]
        if gap >= m:
            if gap <= answer:
                answer = gap
            break
        elif gap >= answer:
            break
print(answer)



