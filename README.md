van-gosh
========
A color library for bash (for 256 colors terminals)



Install
-------
`$ git clone git@github.com:taitulism/van-gosh.git`  
`$ source van-go.sh`



Color Numbers
-------------
Built-in colors:
```
black      = 232
red        = 160
green      = 28
yellow     = 190
blue       = 27
steel-blue = 69
magenta    = 126
cyan       = 81
white      = 15
pink       = 207
orange     = 202
purple     = 54
bordeaux   = 88
gray       = 246
light-gray = 253
```



Colored Screen Loggers
----------------------
Will print your text in different colors:
```sh
logTitle 'MY TITLE'
logText 'bla bla text'
logComment 'a comment about stuff'
logInfo 'info'
logOK 'ok'
logWarn 'warn'
logError 'error'
logAttention 'attention'
logFail 'fail'
logSuccess 'success'
```
![loggers examples](https://raw.githubusercontent.com/taitulism/van-gosh/master/logs-example.png)



Other API
---------
###createColor  
Creates a full color string: `"<flag>;<foreground>;<background>"`
```sh
myColor=$(createColor yellow red 1)

echo $myColor
> "1;38;5;190;48;5;160"
```
**Explaination:**  
; semicolon is the delimiter  

* **1**;38;5;190;48;5;160  
1 is the **bold** flag.  
2 is for **dim**  
4 is for __underline__  
Combine flags by escaping the semicolon with a backslash or just wrap with single quotes: `1\;4` or `'1;4'`

* 1;38;5;**190**;48;5;**160**    
190 is **red**, 160 is **yellow**

* 1;**38;5**;190;**48;5**;160  
38;5; precedes a foreground color  
48;5; precedes a background color

38;5;190 is yellow foreground  
48;5;160 is red background



###colorize  
Returns your text colorized with your color
```
myColor=$(createColor yellow red 1)

echo $(colorize $myColor hello world)
```
***NOTE** color flags are passed as the LAST argument*



###colorz  
There's a `colorz` assocsiative array (a dictionary) of colors.  
You can add your own colors by doing: 
```sh
colorz[my-color]=130    # 0-255
```
