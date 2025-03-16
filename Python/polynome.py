#!/usr/bin/python3 

class Polynome:
    def __init__(self, p: list[float]) -> None:
        self.p = p

    def __add__(self, other):
        r = []
        sp, op = self.p, other.p
        ml = max(len(sp), len(op))
        [sp.append(0) for _ in range(ml-len(sp))]
        [op.append(0) for _ in range(ml-len(op))]
        for i, j in zip(sp, op):
            r.append(i+j)
            other.p = r
        return other

    def __str__(self) -> None:
        pol = [str(j)+"x^"+str(i) for i, j in enumerate(self.p)]
        return '+'.join(pol)

def main() -> None:
    p = Polynome([1, 2, 3])
    q = Polynome([-1, 0, 5, 2.6])
    print(p+q)

if __name__ == '__main__':
    main()
