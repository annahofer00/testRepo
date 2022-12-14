R = QQ[x,y,z, MonomialOrder => Lex]
I = ideal(x^3+y^3+z^2-1,x^7+y^5+z^3-1)
f = "gb.txt" << toExternalString gens gb I;
g = forceGb (gens gb I)

--func = (i,j) -> toList((0,0)..(i,j)) / createIdeal / gens / gb / generators // numgens / source 

func = (i,j) -> (
    I := createIdeal (i,j);
    IG := gens gb I;
    L := flatten entries IG;
    k := sum (L / size);
    print {(i,j)," has ", k, " terms."}
)

func2 = (i,j) -> toList((0,0)..(i,j)) / func

size (x^2 +y)
createIdeal = (i,j) -> ideal(x^i+y^3+z^2-1,x^j+y^5+z^3-1)

p = (x,M) -> (
    k := numgens target M;
    det (M - id_(target M))
)

M = matrix{{0,-1},{1,0}}

--truth/liar riddle 1
R = ZZ/2[a,b,c, MonomialOrder => Lex]
f = a+b+1 --a => not b
g = b+c --b => c
h' = c+a+b+a*b --c -> (a or b)
h = c+a+b --c -> (a or b)
I = ideal(f,g,h)
gens gb I


--A: B is telling the truth
--A => B

--B: C or D are telling the truth
--B => (C or D)

--C: D is lying
--C => not D

--D: There is only one liar
--

R = ZZ/2[a,b,c,d, MonomialOrder => Lex]
f = a+b
g = b+c+d + c*d
h = c + (d+1)
i = d + a*b*c + b*c*d + c*d*a + a*d*b 
I = ideal(f,g,h,i)
gens gb I
gens gb radical I


e_1 = (a,b,c,d) -> a + b + c + d
e_2 = (a,b,c,d) -> a*b + a*c + a*d + b*c + b*d + c*d
e_3 = (a,b,c,d) -> a*b*c + a*b*d + a*c*d + b*c*d
e_4 = (a,b,c,d) -> a*b*c*d  

f = n -> (
    table(n, n-1, (i,j) -> e_i(j))
    )

--symmetrical polynomials
symPoly = n -> (
    s := subsets(n);
    e_n := (x_1..x_n) -> sum 
)
R = QQ[x_1..x_n]
P = {{1,2,3},{4,3,2}}

--ideals of points ad hilbert functions
R = QQ[x_1,x_2,x_3]
f_hilb = (P,i) -> (
    M := flatten entries basis(i,R);
    evalMap := apply(P, p -> map(R,R,p));
    --apply(M, m -> apply(length(P), l -> evalMap_l m))
    N := apply(length(P), p -> apply(M, m -> evalMap_p m));
    rank(matrix(N))
)

I1 = ideal(x_1 - 1, x_2 - 2, x_3 - 3)
I2 = ideal(x_1 - 4, x_2 - 3, x_3 - 2)
I = intersect(I1,I2)

--regular sequences
isRegular = (llist,M) -> (
    if M == ideal(llist)*M then return false;
    N := M;
    if not 0 == ker(map(N^1,N^1, llist_0)) then return false;
    for i from 0 to #llist-2 do (
        N = N/(llist_i);
        if not 0 == ker(map(N^1,N^1, llist_(i+1))) then return false;
    true
    )
)
R = QQ[x,y,z]
sequence = {(x-1)*z, (x-1)*y, x}
isRegular(sequence, R)


--resolution
R = QQ[x,y,z]
I = ideal(x^2,x*y,y^2)

p = gens I
a = kernel p

p1 = gens a
a1 = kernel p1

p2 = gens a1
a2 = kernel p2

r = res coker p
r.dd --explicit maps

prune HH(r) --homology of complex

use ZZ
f1 = matrix{{0}}
f2 = matrix{{2}}
C = chainComplex(f1,f2)
prune HH(C)

net NewType := i -> peek i --how to print a new type nicely