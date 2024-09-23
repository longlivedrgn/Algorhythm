def solution(book_time):
    answer = 0
    rooms = []
    books = []
    for time in book_time:
        hour, minute = time[0].split(":")
        fhour, fminute = time[1].split(":")
        start = int(hour) * 60 + int(minute)
        finish = int(fhour) * 60 + int(fminute)
        books.append([start, finish])
    books.sort()
    for book in books:
        if len(rooms) == 0:
            rooms.append(book[1]+10)
        else:
            for (i, room) in enumerate(rooms):
                if book[0] >= room:
                    rooms[i] = book[1] + 10
                    break
            else:
                rooms.append(book[1]+10)
    return len(rooms)