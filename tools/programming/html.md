Hyper Text Markup Language 5.2






#### definitions
```
<!DOCTYPE html>                        ------> doc type declaration
<html>
<body>                                 ------> visible part of HTML doc

<tagname> Content </tagname>           ------> an element

<p> Line <br> break </p>   ------> <br> is an "empty element" - no closing tag

</body>
</html>
```

#### tags
(common tags attributes mentioned with tab - usually `name="value"`)

`<html>`
	`lang` - declare web page language (and/or country)
e.g. `<html lang="en-US">`

`<h1>` - `<h6>` - headings
	`style="font-size:60px;"` for heading size specification
`<p>` - paragraph
	`style` - style elements like color, font, size
e.g. `<p style="color:red;">This is a red paragraph.</p>`
	`title` - "tooltip" (mouse-over-the-element info)

`<a>` - link
	`href` - lin destination
e.g. `<a href="https://wiki.archlinux.org/">This is a link</a>`

`img` - image
	`src` - source file
	`alt` - alternative text (if img cannot be displayed)
	`width` [px]
	`height` [px]
e.g. `<img src="w3schools.jpg" alt="You suck at cooking" width="104" height="142">`


##### empty elements
that is - with no closing tags

`<br>` line break