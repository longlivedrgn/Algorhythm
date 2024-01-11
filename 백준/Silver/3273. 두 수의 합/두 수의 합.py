number_count = int(input())
numbers = list(map(int, input().split()))
target = int(input())

numbers.sort()
answer = 0
for i in range(0,number_count):
    for j in range(i+1, number_count):
        if numbers[i] + numbers[j] == target:
            answer += 1
            break
        elif numbers[i] + numbers[j] > target:
            break
print(answer)

