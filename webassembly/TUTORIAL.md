### Compiling *wasmt* to asm.js & running it in a browser

#### Prerequisites

Compile a working <a href="http://webassembly.github.io/">WebAssembly</a> toolchain as described <a href="https://github.com/brakmic/brakmic/blob/master/webassembly/COMPILING_WIN32.md">here</a>.

#### Writing an *asmt* source file

The WebAssembly Spec defines binary *wasm* and human-readable *wasmt* files. We will write a simple *echo* function that

takes a single int32 value and returns it back to the caller. Of course, there are many other and much better examples, so you

may want to look for <a href="https://github.com/WebAssembly/spec/tree/master/ml-proto/test">more complex examples</a>.

This is our source file written as a S-Expression <a href="https://github.com/WebAssembly/design/blob/master/AstSemantics.md">according to the Spec</a>.

```lisp
(module
  (memory 256 256)
  (export "echo" $echo)
  (func $echo (param $x i32) (result i32)
    (get_local $x)
  )
)
```

Experienced Lisp/Clojure devs should have no bigger problems with recognizig most important parts.

We begin with *module* declaration and define a certain chunk of memory for future use. This is actually not really needed here as we're not

doing anything extraordinary. It's jut to show how we can manage memory with wasm.

Then we define a *function export* named *echo* that references the *$echo* function below.

This function's definition is straightforward:

- Use keyword *func* to mark the beginning of the function body
- Give it a name with a $ prepended
- Insert any parameters by using *param*, the name of the parameter, and its type
- Complete the function signature by setting the *return value type* and its name [*I'm not using it here*]

Save the source to *echo.wasmt* and run the following tool from Binaryen's toolchain to compile it to an *asm.js* file.

```shell
wasm2asm echo.wast -o echo.js
```

This will create a new file *echo.js* that'll contain this code:

```javascript
function asmFunc(global, env, buffer) {
 "use asm";
 var HEAP8 = new global.Int8Array(buffer);
 var HEAP16 = new global.Int16Array(buffer);
 var HEAP32 = new global.Int32Array(buffer);
 var HEAPU8 = new global.Uint8Array(buffer);
 var HEAPU16 = new global.Uint16Array(buffer);
 var HEAPU32 = new global.Uint32Array(buffer);
 var HEAPF32 = new global.Float32Array(buffer);
 var HEAPF64 = new global.Float64Array(buffer);
 var Math_imul = global.Math.imul;
 var Math_fround = global.Math.fround;
 var Math_abs = global.Math.abs;
 var Math_clz32 = global.Math.clz32;
 function echo(x) {
  x = x | 0;
  return x | 0;
 }

 return {
  echo: echo
 };
}
```

Now create an *index.html* and point to this file by usign a *script* tag.

```html
<html>
<head>Test</head>
 <body>
 <script src="echo.js"></script>
 </body>
</html>
```

Open it in the Browser and go to the Console.

Type in the following to call the *echo* function.

<img src="http://fs5.directupload.net/images/160316/yy67et7p.png"/>

Have fun with WebAssembly. :smile: