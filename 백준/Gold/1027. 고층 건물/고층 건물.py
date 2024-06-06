building_count = int(input())
def slope(x1,x2,y1,y2):
    return (y1-y2)/(x1-x2)

buildings = list(map(int, input().split()))
answer = 0
for (index, building) in enumerate(buildings):
    temp_answer = 0
    # 오른쪽 체크하기
    current_x = index
    current_y = building
    right_slope = -int(1e9)
    for i in range(index+1, building_count):
        temp_x = i
        temp_y = buildings[i]
        temp_slope = slope(current_x, temp_x, current_y, temp_y)
        if temp_slope > right_slope:
            temp_answer += 1
            right_slope = temp_slope


    # 왼쪽 체크하기
    left_slope = int(1e9)
    for i in range(index-1, -1, -1):
        temp_x = i
        temp_y = buildings[i]
        temp_slope = slope(current_x, temp_x, current_y, temp_y)

        if temp_slope < left_slope:
            temp_answer += 1
            left_slope = temp_slope

    answer = max(temp_answer, answer)

print(answer)