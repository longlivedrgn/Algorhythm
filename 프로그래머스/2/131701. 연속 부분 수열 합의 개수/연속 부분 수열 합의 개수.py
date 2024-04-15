def solution(elements):
    answer = 0
    number_set = set()
    for (index, i) in enumerate(elements):
        temp_index = index
        temp_value = i
        number_set.add(i)
        for i in range(1,len(elements)):
            temp_temp_index = temp_index + i
            if temp_temp_index >= len(elements):
                temp_temp_index -= len(elements)
            temp_value += elements[temp_temp_index]
            number_set.add(temp_value)

    return len(number_set)