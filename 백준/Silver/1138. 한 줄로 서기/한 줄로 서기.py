N = int(input())
heights = list(map(int, input().split()))
answers = [0] * N

for (idx, higher) in enumerate(heights):
    zero_count = 0
    for (i, value) in enumerate(answers):
        if zero_count == higher and value == 0:
            answers[i] = idx+1
            break
        if value == 0:
            zero_count += 1
print(*answers)