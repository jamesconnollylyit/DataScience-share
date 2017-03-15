# Use these commands in conjunction with the document called "Introduction to R" on Blackboard.
# Press CTRL + Return keys to copy the command at the current cursor position into
# the R interactive window.

mean(1:5)
? mean

myvariable <- 5
myvariable

#Help commands
? "+"
? "+"
?? plotting #searches for topics containing words like plotting"
?? "regression model" #searches for topics containing phrases like this
help.start
#equivalent to last set
help("mean")
help("+")
help("if")
help.search("plotting")
help.search("regression model")

apropos("vector") #when you can only remember that the variable contains the text "vector"

apropos("z$") #all variables ending in z

apropos("[4-9]") #all variables containing numbers 4 - 9 

#examples of demos on your computer
example(plot)
demo() #list all demonstrations
demo(Japanese)
demo(image)

#Vignettes - short documents on how to use packages
browseVignettes()
#use this if you remember the specific vignette name
vignette("Sweave", package = "utils")

#Search for a package from the R project website
RSiteSearch("{Bayesian regression}")

#Installing extra packages - overview
library() #what packages you’ve saved in your library
.libPaths() # path to local library
installed.packages()
update.packages()
install.packages("installr") #download and install the package named installr
library(installr) #load the installr package
install.Rtools() #Rtools is needed for building your own packages
install.git() #git provides version control for your code
help(package = "installr")

#operators
1:5 + 6:10 #look, no loops!

c(1, 3, 6, 10, 15) + c(0, 1, 3, 6, 10)
sum(1:5)
median(1:5)

#vectorisation over arguments - calculate summary statistic from input args
sum(1, 2, 3, 4, 5)
median(1, 2, 3, 4, 5) #this throws an error
c(2, 3, 5, 7, 11, 13) - 2 #subtraction
- 2:2 * -2:2 #multiplication
identical(2 ^ 3, 2 ** 3) #we can use ^ or ** for exponentiation - ^ is more common
1:10 / 3 #floating point division
1:10 %/% 3 #integer division
1:10 %% 3 #remainder after division

#trig functions
cos(c(0, pi / 4, pi / 2, pi)) #pi is a built-in constant
exp(pi * 1i) + 1 #Euler's formula
factorial(7) + factorial(1) - 71 ^ 2 #5041 is a great number
choose(5, 0:5)

#Comparisons: use == and NOT =
c(3, 4 - 1, 1 + 1 + 1) == 3 #operators are vectorised too
1:3 != 3:1
exp(1:5) < 100
(1:5) ^ 2 >= 16

#problems with rounding errors
sqrt(2) ^ 2 == 2 #sqrt is the square-root function - should be identical
sqrt(2) ^ 2 - 2 #this small value is the rounding error

#all equal - tolerance level
all.equal(sqrt(2) ^ 2, 2)
all.equal(sqrt(2) ^ 2, 3)
isTRUE(all.equal(sqrt(2) ^ 2, 3)) #call isTRUE to provide true or false result

#Compare strings
c(
"Can", "you", "can", "a", "can", "as",
"a", "canner", "can", "can", "a", "can?"
) == "can"
c("A", "B", "C", "D") < "C"
c("a", "b", "c", "d") < "C" #your results may vary - this is a bad idea

#Assigning variables - no declaration
x <- 1:5
y <- 6:10 # bad idea
x + 2 * y - 3
? make.names # variable names
x <- 3 #is this assignment or less than?
x
x < -3
x <<- exp(exp(1)) #global assignment
x

#Local variables
assign("my_local_variable", 9 ^ 3 + 10 ^ 3)
my_local_variable
assign("my_global_variable", 1 ^ 3 + 12 ^ 3, globalenv()) #global variable
my_global_variable

#Print variable output
z <- rnorm(5);
# random number generator - normal distribution
z
zz <- rlnorm(5)

#Special numbers
c(Inf + 1, Inf - 1, Inf - Inf)
c(1 / Inf, Inf / 1, Inf / Inf)
c(sqrt(Inf), sin(Inf))
c(log(Inf), log(Inf, base = Inf))
c(NA + 1, NA * 5, NA + Inf)
c(NA + NA, NaN + NaN, NaN + NA, NA + NaN)

x <- c(0, Inf, - Inf, NaN, NA)
is.finite(x)
is.infinite(x)
is.nan(x)
is.na(x)

#Logical vectors
(x <- 1:10 >= 5)
!x
(y <- 1:10 %% 2 == 0) #Note %% = MOD
x & y
x | y

#Create a truth table
x <- c(TRUE, FALSE, NA) #the three logical values
xy <- expand.grid(x = x, y = x) #get all combinations of x and y
within(
    xy, {
        and <- x & y
        or <- x | y
        not.y <- !y
        not.x <- !x
    }
)
#Any true?
none_true <- c(FALSE, FALSE, FALSE)
some_true <- c(FALSE, TRUE, FALSE)
all_true <- c(TRUE, TRUE, TRUE)

any(none_true)
any(some_true)
any(all_true)
all(none_true)
all(some_true)
all(all_true)
