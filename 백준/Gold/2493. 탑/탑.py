N = int(input())
buildings = list(map(int, input().split()))
answer = [0] * N
temp_stack = []

for (idx, value) in enumerate(buildings):
    while temp_stack:
        if temp_stack[-1][1] >= value:
            answer[idx] = temp_stack[-1][0] + 1
            break
        else:
            temp_stack.pop()
    temp_stack.append([idx, value])
print(*answer)


