# AS2 XML Parser
** This is an old library from 2004 and I put i on github for backup!! **


XML reading with the built-in functions in as2 is not the funniest things to do. In as3 it’s a lot better as you probably know. To make it easier in as2 I made a xmlparser that makes it possible to read the xml as a dom-tree. There are a lot of similar classes and some of them are probably better then mine or at least more advanced. This class is only for reading since you almost never alter xmls and seldom write them. The class is about 4 years old but since I use it in almost every as2 project I thought I could share it.

usage:

	import se.superkrut.util.XMLDom;
	
	var xml:XML = new XML();
	xml.ignoreWhite = true;
	xml.onLoad = function(){
		var xmldom:XMLDom = new XMLDom(this);
		trace("first:"+xmldom.root.language.swedish.text.bye.value);
		trace("second:"+xmldom.root.language.swedish.text[1].value);
		trace("attribute:" + xmldom.root.language.attributes.id);
	}
	
	xml.load("language.xml");
	
where language.xml is:
	
	<?xml version="1.0" ?>
	<root>
		<language id="swedish">
			<text id="hello">hej</text>
			<text id="bye">hej då</text>
		</language>
	</root>

all instances have a `__resolve` function that maps unknown calls to the first position in the child array. 

Example: `xmldom.root.language` is the same as `xmldom.root[0].language`

the attribute id is automatically mapped to a property in the instance. Example:
language.swedish is mapped from the id attribute.