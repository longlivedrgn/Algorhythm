from collections import defaultdict

def solution(k, tangerine):
    answer = 0
    tangerines = defaultdict(int)
    
    for tan in tangerine:
        tangerines[tan] += 1
    
    temp_tangerines = []
    for tanger_item in tangerines.items():
        temp_tangerines.append(tanger_item)
    sorted_tangerines = sorted(temp_tangerines, key=lambda tanger: tanger[1], reverse = True)
    
    tangerine_count = 0

    for (index,tanger) in enumerate(sorted_tangerines):
        tangerine_count += tanger[1]
        if tangerine_count >= k:
            return index + 1