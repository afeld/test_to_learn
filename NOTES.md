* build up a test suite, and a testing library to go with it
* command-line TODO app
    * classes: List, Item
    * add "started" status (trinary vs binary state)
    * persisting

* a big part of getting better at coding is overcoming the fear of breaking things
* it's not that the risk diminshes (the projects get more complex and the problems are new)
* mitigate risk
    * version control
    * abstraction
        * you don't drive a car by pressing a button for the spark plugs to fire
        * you don't use a computer by flipping switches (anymore)
    * staging
    * testing
* learn how something works by testing its limits
    * examples:
        * bicycle
        * baby crying
        * teenager
        * tree/rock climbing
    * what's scary about testing limits?
        * falling down
        * no reset button
    * in software, we don't have those problems
        * except after it's released
        * so break while you still have a reset button
* different kinds of testing
    * unit
        * multiple approaches
            * isolate that piece
            * isolate that piece and everything below it
    * integration
        * interaction-y things are hard to test, so move as much out of there as you can
    * [more details](http://stackoverflow.com/questions/4904096/whats-the-difference-between-unit-functional-acceptance-and-integration-test)
* testing forces you to write better code
    * look at it from the outside in
        * the UX perspective
    * encourages you to break it into smaller pieces
