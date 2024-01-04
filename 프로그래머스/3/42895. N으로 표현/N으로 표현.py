def solution(N, number):
    set_list = []

    for i in range(1,9):
        temp_set = set()
        temp_set.add(int(str(N)*i))

        for count in range(i - 1):
            for first in set_list[count]:
                for second in set_list[-count-1]:
                    temp_set.add(first + second)
                    temp_set.add(first * second)
                    temp_set.add(first - second)
                    if second != 0:
                        temp_set.add(first // second)
        if number in temp_set:
            return i

        set_list.append(temp_set)

    return -1

print(solution(5, 12))