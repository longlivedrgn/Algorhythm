N = int(input())
liquids = list(map(int, input().split()))
answer = float("INF")
left = 0
right = 0

for i in range(N-1): # index 0부터 index 마지막 보다 한 칸 앞까지 싹 다 순회를 한다.
    current = liquids[i]
    temp_left = i+1
    temp_right = N-1

    while temp_left <= temp_right:
        mid = (temp_left + temp_right) // 2
        temp_sum = liquids[mid] + current

        if abs(temp_sum) < answer:
            answer = abs(temp_sum)
            left = i
            right = mid

            if temp_sum == 0:
                break
        if temp_sum < 0:
            temp_left = mid + 1
        else:
            temp_right = mid - 1

print(liquids[left], liquids[right])
