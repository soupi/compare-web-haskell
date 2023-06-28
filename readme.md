benchmarking Spock, scotty, and twain against
[bun-http-framework-benchmark](https://github.com/SaltyAom/bun-http-framework-benchmark)
using [bombardier](https://github.com/codesenberg/bombardier).

## Compile

```
cabal build all
```

## Benchmark

```
echo "---- Spock ----"
(cabal run hello-spock & sleep 1 && bash bench.sh && kill $!)
echo "---- Scotty ----"
(cabal run hello-scotty & sleep 1 && bash bench.sh && kill $!)
echo "---- Twain ----"
(cabal run hello-twain & sleep 1 && bash bench.sh && kill $!)
```

# Validate results

```
echo "---- Spock ----"
(cabal run hello-spock & sleep 1 && bash validate.sh && kill $!)
echo "---- Scotty ----"
(cabal run hello-scotty & sleep 1 && bash validate.sh && kill $!)
echo "---- Twain ----"
(cabal run hello-twain & sleep 1 && bash validate.sh && kill $!)
```
