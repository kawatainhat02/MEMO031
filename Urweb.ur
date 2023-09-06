1 + 1
== 2

1.2 + 3.4
== 4.6

"Hello " ^ "world!"
== "Hello world!"

1 + 1 < 6
== True

0.0 < -3.2
== False

"Hello" = "Goodbye" || (1 * 2 <> 8 && True <> False)
== True

fun double n = 2 * n

double 8
== 16

fun fact n = if n = 0 then 1 else n * fact (n - 1)

fact 5
== 120

fun isEven n = n = 0 || (n > 1 && isOdd (n - 1))
and isOdd n = n = 1 || (n > 1 && isEven (n - 1))

isEven 32
== True
isEven 31
== False
