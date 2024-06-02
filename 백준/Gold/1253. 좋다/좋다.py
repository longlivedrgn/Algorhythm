number = int(input())
numbers = list(map(int, input().split()))
count = 0
numbers.sort()
for i in range(number):
    goal = numbers[i]
    head = 0
    tail = number-1

    while head < tail:
        if numbers[head] + numbers[tail] < goal:
            head += 1
        elif numbers[head] + numbers[tail] > goal:
            tail -= 1
        else:
            if head == i:
                head += 1
            elif tail == i:
                tail -= 1
            else:
                count += 1
                break
print(count)


