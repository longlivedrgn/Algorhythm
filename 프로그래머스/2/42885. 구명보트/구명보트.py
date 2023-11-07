def solution(people, limit):
        # 먼저 sorting하기
    sorted_people = sorted(people)
    board_count = 0
    start = 0
    end = len(people) - 1

    while start <= end: # start != end로 하면 안된다. -> start랑 end가 같아지지 않고, 확 역전되는 순간이 존재하기 때문이다.
        if sorted_people[start] + sorted_people[end] <= limit: # 만약 맨 앞이랑 맨 뒤를 구출할 수 있다면?
            start += 1 # 맨 앞에 있는 얘 구명보트에 넣기
            end -= 1 # 맨 뒤에 있는 얘 구명보트에 넣기
        else: # 만약에 가장 작은 얘랑 가장 무거운 얘가 같이 구명보트에 들어갈 수 없다면?..
            end -= 1 # 그러면 일단 무거운 얘부터 그냥 넣는다.
        board_count += 1 # 그리고 무조건 board는 하나 올린다.

    return board_count