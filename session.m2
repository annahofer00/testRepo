restart

ht = hashTable { 7 => "hello", b => "goodbye", QQ => "rational"}

ht.b
ht#b
ht#7
ht#QQ

b = 123
ht#b
ht.b

class QQ
class {1,2,3}

ancestors class {1,2,3}

g = method()
g Thing := Thing => i -> i +1

ancestors Ideal

g(7)
g(ideal 1)

----debugging
error "error is here" --trigger an error

R = QQ[x,y]
ideal(x)
oo + ideal(y) --oo previous output
ooo + ideal(y^2)
oooo + ideal(y^3)

viewHelp gbTrace
gbTrace = 3

R = QQ[x,y,z, MonomialOrder => Lex]
I = ideal(x^5+y^3 +z^2 -1, x^7 + y^5 + z^3 -1)
gens gb I --Ctrl + C to interrupt
elapsedTime gens gb I;

o17 --to access a specific line

gens R
R_0
R_1

0_R
1_R

map(R^1,R^1,1)
methods map
viewHelp map

R = QQ[x,y,z]
R = QQ[x_1,x_2]

f = n -> (
    x := symbol x;
    R := QQ[x_1 ..x_n];
    ideal gens I
)

x_1
x
f 3

restart
R = QQ[x,y]
x
f = () -> QQ[x,y]; --bad, this "uses" the newly created ring, messing up user variables  
f = () -> QQ(monoid [x,y]); --fix, doesn't use the new ring

f()

x
use R
x