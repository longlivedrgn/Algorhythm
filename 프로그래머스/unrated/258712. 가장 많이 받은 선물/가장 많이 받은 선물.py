def solution(friends, gifts):
    name_hash = {}
    for (index,friend) in enumerate(friends):
        name_hash[friend] = index

    present_list = [[0 for _ in range(len(friends))] for _ in range(len(friends))]

    for gift in gifts:
        splitted = gift.split()
        present_list[name_hash[splitted[0]]][name_hash[splitted[1]]] += 1

    present_value = {}
    for (index, friend) in enumerate(friends):
        give = sum(present_list[index])
        get = 0
        for present in present_list:
            get += present[index]
        present_value[index] = give - get

    answer = 0
    for (index, friend) in enumerate(friends):
        temp = 0
        for j in range(len(friends)):
            if index == j:
                continue
            if present_list[index][j] > present_list[j][index]:
                temp += 1
            elif present_list[index][j] == present_list[j][index]:
                if present_value[index] > present_value[j]:
                    temp += 1
        if temp > answer:
            answer = temp
    return answer