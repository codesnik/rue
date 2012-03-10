Gemini Rue vents puzzle solver
==============================

there's that awesome game: Gemini Rue (http://wadjeteyegames.com/gemini-rue.html),
and it contains that easy puzzle.
But I'm lazy, stupid, and bored, so I git init...

Rules
=====

there are 10 vents
vents are connected as follows

    1 - 2 - 3
    | / |   |
    4   5 - 6
    |   | / |
    7 - 8   9
    |
    10

initially all vents are off.

toggling power on vent toggles power on each connected vent.

solution should have a power line between vent 10 and 3,

but only five vents should be on at maximum

Solvers
========

script/random_solver.rb
-----------------------

it just tries random moves.

funny enough, it was sufficient! try to beat THAT:

    ~/src/rue> script/random_solver.rb
    when you lose patience press control+C
    found solution in 4 moves (try #1)
    ^Csolution found:
    8 0 2 4
