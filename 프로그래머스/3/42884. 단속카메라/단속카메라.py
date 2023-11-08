def solution(routes):
    routes.sort()
    start = routes[0][0]
    end = routes[0][1]
    count = 0
    for route in routes:
        tempStart = route[0]
        tempEnd = route[1]
        if start <= tempStart <= end:
            start = tempStart
            if tempEnd <= end:
                end = tempEnd
        else:
            count += 1
            start = tempStart
            end = tempEnd
    
    return count+1