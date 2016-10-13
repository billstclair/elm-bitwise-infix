----------------------------------------------------------------------
--
-- BitwiseInfix.elm
-- Infix versions of the Bitwise functions
-- Copyright (c) 2016 Bill St. Clair <billstclair@gmail.com>
-- Some rights reserved.
-- Distributed under the MIT License
-- See LICENSE.txt
--
----------------------------------------------------------------------

module BitwiseInfix exposing ( (~&), (~|), (~^), lognot
                             , (~<<), (~>>), (~>>>)
                             )

{-| This module provides infix versions of Elm's Bitwise module functions.
This greatly eases conversion of existing JavaScript code.
Intead of changing infix to prefix, just prepend a twiddle (~) 
to the operators.

```Bitwise.not``` has no infix operator, since Elm doesn't provide
single argument "infix" operators. So I named it
```BitwiseInfix.lognot```, in honor of its Common Lisp name.

It is intended to be imported exposing (..), so that the operators can
appear unadorned in your code.

All the operators are left associative.

I mirrored the JavaScript precedences, putting the shift operators at
lower precedence than arithmetic, but higher than comparison, and the
others lower than comparison.

```(~<<)```, ```(~>>)```, and ```(~>>>)``` have a precedence of 5.<br/>
```(~&)``` has a precedence of 3.<br/>
```(~^)``` has a precedence of 2.<br/>
```(~|)``` has a precedence of 1.

Examples:

```
import BitwiseInfix exposing (..)

3 ~& 1 ~| 4 ~& 12     -- 5
3 ~& (1 ~| 4) ~& 12   -- 0
2 ~<< 1 ~| 2          -- 6
2 ~<< (1 ~| 2)        -- 16
1 ~| 2 ~^ 2 ~| 1      -- 1
(1 ~| 2) ~^ (2 ~| 1)  -- 0
3 ~& 1 ~^ 4 ~& 12     -- 5
3 ~& (1 ~^ 4) ~& 12   -- 0
9 ~>> 1 ~<< 1         -- 8
9 ~>> (1 ~<< 1)       -- 2
```

# Functions
@docs (~&), (~|), (~^), lognot, (~<<), (~>>), (~>>>)
-}

import Bitwise

{-| Infix for Bitwise.and -}
(~&) : Int -> Int -> Int
(~&) x y =
  Bitwise.and x y

{-| Infix for Bitwise.or -}
(~|) : Int -> Int -> Int
(~|) x y =
  Bitwise.or x y

{-| Infix for Bitwise.xor -}
(~^) : Int -> Int -> Int
(~^) x y =
  Bitwise.xor x y

{-| Alias for Bitwise.not.
Elm does not provide "infix" operators with only a single argument.
This name let's you import BitwiseInfix exposing (..), without
worrying about name collisions.
-}
lognot : Int -> Int
lognot x =
  Bitwise.complement x

{-| Infix for Bitwise.shiftLeft -}
(~<<) : Int -> Int -> Int
(~<<) x shift =
  Bitwise.shiftLeft x shift

{-| Infix for Bitwise.shiftRight -}
(~>>) : Int -> Int -> Int
(~>>) x shift =
  Bitwise.shiftRight x shift

{-| Infix for Bitwise.shiftRightLogical -}
(~>>>) : Int -> Int -> Int
(~>>>) x shift =
  Bitwise.shiftRightLogical x shift

infixl 5 ~<<
infixl 5 ~>>
infixl 5 ~>>>
infixl 3 ~&
infixl 2 ~^
infixl 1 ~|
