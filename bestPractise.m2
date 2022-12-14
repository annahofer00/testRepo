restart
f = i -> i+1
f 7

g = (a,b,c) -> (a+2,b+3,c+7)
g(1,7,-3)

R = QQ[x,y]
complicated = I -> (
    J := radical I; --not returned
    if J = ideal(x,y) then return ideal(0_R);
    return (J + ideal(x,y))
)
complicated(ideal(x^2+7))
complicated(ideal(x,y))

I = ideal(x)
if I == ideal(x,y) then (
    print "Hello"
)

for i from 0 to 7 do (print(i))
for i from 0 to 7 list(i^2)

--don't
l = {}
for i from 0 to 7 do (
    l = l | {i^2}
)

for word in {"my", "name", "is"} do print word

apply(toList(0..7), i-> i^2)
toList(0..7) / (i -> i^2)

R = QQ[x,y,z,w]
I = ideal(x^2+y,y^2-x+z,w+x)
prim_dec = primaryDecomposition I
prim_dec / dim

primaryDecomposition I / radical // unique
unique(primaryDecomposition I / radical)

unique {1,1,2}
subsets(4,2) / (i -> p_i)
S = QQ(subsets(4,2) / (i -> p_i))
describe S