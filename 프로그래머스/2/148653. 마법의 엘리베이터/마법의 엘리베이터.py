def solution(storey):
    answer = 0
    while True:
        if storey == 0:
            return int(answer)
        one_digit = storey % 10
        if one_digit > 5:
            answer += (10-one_digit)
            storey += (10-one_digit)
        elif one_digit < 5:
            answer += one_digit
            storey -= one_digit
        else:
            if (storey // 10) % 10 > 4:
                storey += 10
            answer += one_digit
        storey = storey // 10