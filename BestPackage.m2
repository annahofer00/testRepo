newPackage(
    "BestPackage",
    Headline => "an amazing package"
)

export {"bestMethod"}

bestMethod = method()
bestMethod ZZ := String => i -> if i == 0 then "hello" else "bye"

TEST ///
assert(bestMethod(0) == "hello")
///

beginDocumentation()

doc ///
Key
    bestMethod
Headline
    a great method, for integers
///

doc ///
Key
    (bestMethod, ZZ)
Headline
    a great method, for integers
Usage
    greeting = bestMethod(i)
Inputs
    i:ZZ
     either 1 or something else
Outputs
    greeting:String
     a nice greeting
Description
    Text
     This method outputs a nice greeting based on input... The integer 0 gives a hello
    Example
     bestMethod(0)
    Text
     ihkhh
    Example
     bestMethod(123)
///

end

restart
uninstallPackage "BestPackage"
installPackage "BestPackage"

needsPackage "BestPackage"
check(BestPackage)

needsPackage "Graphs"
viewHelp Graphs

R = QQ[x,y,z] 
I = ideal(x^2)
amult I

needsPackage "SimpleDoc"
viewHelp SimpleDoc


--hashtables
ht = hashTable {
    h => "Hello",
    b => "Bye"
}

ancestors class I
peek I
I.ring
peek I.cache
--most things are hashtables

f = i -> i+1
f(7)
f(7/2)
f(I) --adds 1 to the set of generators!

g = method()
g(7)

--method name <input type> := <output type>
g ZZ := ZZ => i -> i^2
g QQ := QQ => i -> i^2
g(7)
g(1/2)
g(I)

g(QQ,QQ) := QQ => (i,j) => i^2 + j^2 --only up to 4 inputs!
h(1/2,3/4)

h = method(Options => { Shift => 0})
h ZZ := ZZ => opts -> i -> i + 1 + opts.Shift
h(7) 
