import math
import itertools
from typing import Dict, List, Tuple

def odleglosc_miedzy_punktami(x1, y1, x2, y2):
    return math.sqrt((x2 - x1)**2 + (y2 - y1)**2)

def wczytaj_punkty() -> Dict[str, Tuple[int, int]]:
    punkty = {}
    n = int(input("Podaj liczbe punktow: "))
    for i in range(n):
        nazwa_punktu = input(f"Podaj nazwe punktu {i + 1}: ")
        x, y = map(int, input(f"Podaj wspolrzedne punktu {nazwa_punktu} (oddzielone spacja): ").split())
        punkty[nazwa_punktu] = (x, y)
    return punkty

punkty = wczytaj_punkty()
punkt_lista = list(punkty.values())

n = len(punkt_lista)
macierz_odleglosci = {}

print("Obliczanie macierzy odleglosci:")
for i in range(n):
    wiersz = []
    for j in range(n):
        if i == j:
            wiersz.append((j, 0))
        else:
            odleglosc = odleglosc_miedzy_punktami(punkt_lista[i][0], punkt_lista[i][1], punkt_lista[j][0], punkt_lista[j][1])
            wiersz.append((j, odleglosc))
            print(f"Odleglosc miedzy punktami {list(punkty.keys())[i]} i {list(punkty.keys())[j]}: {odleglosc:.2f}")
    macierz_odleglosci[i] = wiersz
    print()

# ... (tutaj umieść zmodyfikowaną funkcję held_karp) ...

def held_karp(graph: Dict[int, List[Tuple[int, float]]]) -> Tuple[float, List[int]]:
    n = len(graph)
    C = {(frozenset([i, 0]), i): (dist, [0, i]) for i, (node, dist) in enumerate(graph[0][1:], 1)}

    for size in range(2, n):
        for S in itertools.combinations(range(1, n), size):
            S = frozenset(S) | {0}
            for i in S - {0}:
                C[(S, i)] = min(((C.get((S - {i}, k), (float("inf"), []))[0] + graph[k][i][1]), C.get((S - {i}, k), (float("inf"), []))[1] + [i]) for k in S if k != i)
                print(f"Sprawdzanie podzbioru {set(S)}, punkt {i}: {C[(S, i)]}")

    C_min = min(((C[frozenset(range(1, n)) | {0}, i][0] + graph[i][0][1]), C[frozenset(range(1, n)) | {0}, i][1] + [0]) for i in range(1, n))
    return C_min

print("Uruchamianie algorytmu Held-Karp:")
shortest_path, path_nodes = held_k
