buildings_count = int(input())
buildings = list(map(int, input().split()))
def slope(x1,x2,y1,y2):
    return (y1-y2)/(x1-x2)
answer = 0
for idx, height in enumerate(buildings):
    temp_answer = 0
    current_index = idx
    current_height = height

    right_slope = -int(1e9)
    for right in range(idx+1, buildings_count):
        right_index = right
        right_height = buildings[right]
        temp_slope = slope(current_index, right_index, current_height, right_height)
        if right_slope < temp_slope:
            temp_answer += 1
            right_slope = temp_slope

    left_slope = int(1e9)
    for left in range(idx-1, -1, -1):
        left_index = left
        left_height = buildings[left]
        temp_slope = slope(current_index, left_index, current_height, left_height)
        if left_slope > temp_slope:
            temp_answer += 1
            left_slope = temp_slope
    answer = max(answer, temp_answer)
print(answer)


