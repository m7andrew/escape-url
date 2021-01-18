
[Janet](https://janet-lang.org) library to escape and unescape url strings.

* `escape` Takes a string, returns a new escaped string.
* `unescape` Takes a string, returns a new unescaped string.

### Example

```clojure
(import url)

(url/escape "Hello World!") 

  "Hello%20World%21"

(url/unescape "Hello%20World%21")

  "Hello World!"
```
