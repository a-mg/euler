My solutions to Project Euler problems, written in [Racket][rl].

  [rl]: https://racket-lang.org/

Before deciding to learn the Racket dialect, I wrote solutions to a subset of
the problems in R5RS [Scheme][mit]. This code is contained in the `mit-scheme`
branch of this repository.

  [mit]: https://www.gnu.org/software/mit-scheme/

Solutions are contained in the `prob/` directory, with one file for each
problem. Where I have needed utility functions not contained within the Racket
libraries, these are contained in modules within `util/`. When writing Scheme, I
set it as an exercise to avoid built in functions and write most of my code from
scratch. In Racket, I'm more interested in exploring the language and making
efficient use of libraries when necessary.

I have installed and made use of these Racket packages:

* [threading](https://docs.racket-lang.org/threading/index.html)

**Note: this branch is deprecated, and included as an archive. See current work
in `master`.**
