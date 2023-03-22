import math

def odleglosc_miedzy_punktami(x1, y1, x2, y2):
    return math.sqrt((x2 - x1)**2 + (y2 - y1)**2)

punkty = {
    "A": (2, 2),
    "B": (0, 5),
    "C": (8, 10),
    "D": (2, 9),
    "E": (3, 5),
    "F": (1, 10),
    "G": (7, 4),
}

for nazwa1, wspolrzedne1 in punkty.items():
    for nazwa2, wspolrzedne2 in punkty.items():
        if nazwa1 != nazwa2:
            odleglosc = odleglosc_miedzy_punktami(wspolrzedne1[0], wspolrzedne1[1], wspolrzedne2[0], wspolrzedne2[1])
            print(f"Odleglosc miedzy punktami {nazwa1} i {nazwa2}: {odleglosc:.2f}")
