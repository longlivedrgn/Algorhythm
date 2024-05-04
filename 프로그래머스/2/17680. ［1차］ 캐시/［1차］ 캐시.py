def solution(cacheSize, cities):
    answer = 0
    cache = []
    if cacheSize == 0:
        return len(cities) * 5
    for city in cities:
        changed_city = city.upper()
        if changed_city not in cache:
            if len(cache) == cacheSize:
                cache.pop(0)
            cache.append(changed_city)
            answer += 5
            
        else:
            answer += 1
            cache.remove(changed_city)
            cache.append(changed_city)
            
    
    return answer