import itertools
from itertools import product

def solution(dice):
    dice_number = len(dice)
    pick_list = list(itertools.combinations([i for i in range(dice_number)], dice_number // 2))

    def calculate_sum_combinations(arr, indices):
        dices = []
        for idx in indices:
            dices.append(arr[idx])
        combinations = product(*dices)
        result = [sum(combo) for combo in combinations]
        return result

    answer = 0
    number = 0
    for pick in pick_list: # (0,1)
        sum_A  = calculate_sum_combinations(dice, pick)
        tempPickList = [i for i in range(dice_number)]
        b_pick = [x for x in tempPickList if x not in pick]
        sum_B = calculate_sum_combinations(dice, b_pick)
        sum_A.sort()
        sum_B.sort()
        tempCount = 0
        j = 0
        for num1 in sum_A:
            while j < len(sum_B) and num1 > sum_B[j]:
                j += 1
            tempCount += j

        if tempCount > number:
            answer = pick
            number = tempCount

    return list(map(lambda x: x+ 1, answer))