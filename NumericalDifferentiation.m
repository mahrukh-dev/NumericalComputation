function  NumericalDifferentiation()


h=input('Enter stepsize: ')
x=input('Enter required x: ')
func=input('Enter function: ', 's')
f=inline(func)

%two point forward
firstDerFwd = (f(x+h) - f(x))/h

%two pint backward
firstDerBwd = (f(x)-f(x-h))/h

%two point central
firstDerC = (f(x+h) - f(x-h))/(2*h)

%EXACT FIRST DERIVATIVE
dervOnefun = diff(sym(func))
dervOne = inline(dervOnefun)
exactDerOne = dervOne(x)

%CALCULATING ERROR
ErrOne = abs(exactDerOne - firstDerFwd)
ErrTwo = abs(exactDerOne - firstDerBwd)
ErrThree = abs(exactDerOne - firstDerC)

%SECOND DERAVATIVEEE

%three point forward
secondDerFwd = (-f(x+(2*h))+(4*f(x+h))-3*f(x))/(2*h)

%three point backward
secondDerBwd = (f(x-(2*h))-(4*f(x-h))+3*f(x))/(2*h)

%EXACT SECOND DERIVATIVE
dervTwo = diff(sym(dervOnefun))
dervTwo = inline(dervTwo)
exactDerTwo = dervTwo(x)

%CALCULATING ERROR
ErrFour = abs(exactDerTwo - secondDerFwd)
ErrFive = abs(exactDerTwo - secondDerBwd)

end

