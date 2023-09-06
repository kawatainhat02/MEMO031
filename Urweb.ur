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

val inc = fn x => x + 1

inc 3
== 4

fun id [a] (x : a) : a = x

id "hi"
== "hi"

fun compose [a] [b] [c] (f : b -> c) (g : a -> b) (x : a) : c = f (g x)

compose inc inc 3
== 5

fun predecessor (n : int) : option int = if n >= 1 then Some (n - 1) else None

predecessor 6
== Some(5)

predecessor 0
== None

val numbers : list int = 1 :: 2 :: 3 :: []
val strings : list string = "a" :: "bc" :: []

fun length [a] (ls : list a) : int =
    case ls of
        [] => 0
      | _ :: ls' => 1 + length ls'

length numbers
== 3

length strings
== 2

fun mp [a] [b] (f : a -> b) : list a -> list b =
    let
        fun loop (ls : list a) =
            case ls of
                [] => []
              | x :: ls' => f x :: loop ls'
    in
        loop
    end

mp inc numbers
== 2 :: 3 :: 4 :: []

mp (fn s => s ^ "!") strings
== "a!" :: "bc!" :: []

datatype tree a = Leaf of a | Node of tree a * tree a

fun size [a] (t : tree a) : int =
    case t of
        Leaf _ => 1
      | Node (t1, t2) => size t1 + size t2

size (Node (Leaf 0, Leaf 1))
== 2

size (Node (Leaf 1.2, Node (Leaf 3.4, Leaf 4.5)))
== 3

fun tmap [a] [b] (f : a -> b) : tree a -> tree b =
    let
        fun loop (t : tree a) : tree b =
            case t of
                Leaf x => Leaf (f x)
              | Node (t1, t2) => Node (loop t1, loop t2)
    in
        loop
    end

tmap inc (Node (Leaf 0, Leaf 1))
== Node(Leaf(1), Leaf(2))

