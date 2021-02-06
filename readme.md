
A small [Janet](https://janet-lang.org) library to escape and unescape URL strings.

## Install

```
jpm install https://github.com/m7andrew/escape-url
```

## Examples

```clojure
(import url)

(url/escape "Hello World!") 

  "Hello%20World%21"

(url/unescape "Hello%20World%21")

  "Hello World!"
```

## Functions

* [Escape](#escape)
* [Unescape](#unescape)

### Escape

```clojure
(url/escape str)
```

Takes a string `str` and returns a new escaped string.

### Unescape

```clojure
(url/unescape str)
```

Takes a string `str` and returns a new unescaped string.
