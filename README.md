van-gosh
========
A color library for 256 colors terminals.



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


### colorNum  
There's a `colorNum` assocsiative array (a dictionary) of colors.  
You can add your own colors by doing: 
```sh
colorNum[my-color]=130    # 0-255
```


Global Color Variables
----------------------
* _red
* _green
* _lblue  ( = steel-blue)
* _yellow
* _orange
* _gray
* _lgray ( = light gray)

`echo $_red` -> '38;5;160'



Simple Paint Functions
----------------------
These functions use the global colors:
* paintRed
* paintGreen
* paintBlue
* paintYellow
* paintOrange

`paintRed hello world` will echo a red string.



Colored Screen Loggers
----------------------
Will print your text in different colors. Mostly **bold** colors and background colors:
```sh
logTitle 'MY TITLE'
logText 'bla bla text'
logComment 'a comment about stuff'
logInfo 'info'
logOK 'ok'
logWarn 'warn'
logError 'error'
logHighlight 'attention'
logFail 'fail'
logSuccess 'success'
```
![loggers examples](https://raw.githubusercontent.com/taitulism/van-gosh/master/logs-example.png)



### paint  
Returns your text colorized with your color
Args:  
`createColor <foreground>;<background>;<flag>`
```
myColor=$(createColor yellow red 1)

echo $(paint $myColor hello world)
```
***NOTE:** color flags are passed as the LAST argument*

1 is the **bold** flag.  
2 is for **dim**  
4 is for __underline__



Other API
---------
### createColor  
Creates a full color string: `"<flag>;<foreground>;<background>"`
```sh
myColor=$(createColor yellow red 1)

echo $myColor
> "1;38;5;190;48;5;160"
```
**Explanation:**  
; semicolon is the delimiter  

* **1**;38;5;190;48;5;160  
1 makes the color **bold**.  
Combine flags by escaping the semicolon with a backslash or just wrap with single quotes: `1\;4` or `'1;4'`

* 1;**38;5**;190;**48;5**;160  
38;5; precedes a foreground color  
48;5; precedes a background color

* 1;38;5;**190**;48;5;**160**    
190 is **red**, 160 is **yellow**

38;5;190 is yellow foreground  
48;5;160 is red background




