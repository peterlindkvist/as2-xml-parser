dynamic class se.superkrut.util.XMLDom{
	private var value:String;
	private var attributes:Object;
	private var children:Array;
	private var nodename:String;
	
	public function XMLDom(x:XMLNode){
		var n:XMLNode = x;
		value = n.firstChild.nodeValue;
		attributes = n.attributes;
		nodename = n["localName"];
		children = new Array();
		if (n.nodeType == 1 && n.firstChild.nodeType != 3) {
			for(var i:Number = 0; i<n.childNodes.length;i++){
				var cn:XMLNode = n.childNodes[i];
				var nName:String = cn["localName"];
				children.push(nName);
				
				if(this[nName]==undefined){
					this[nName] = new Array();
					this[nName].__resolve = resolve;
				}
				var xp:XMLDom = new XMLDom(cn);
				var ni:String = cn.attributes.id;
				if(ni!= undefined) this[nName][ni] = xp;
				this[nName].push(xp);
			}
		}
	}
	
	public function resolve(v:Object):Object{ //scope this[cn.nodeName]!!
		return this[0][v];
	}
	
	public function get length():Number{
		var cnt:Number = 0;
		while(this[cnt++]!=undefined);
		return cnt;
	}
	
	public function toString():String{
		var ret:String = "";
		ret+="CHILDNODES:\n";
		for(var i:Number = 0;i<children.length;i++){
			ret+=children[i]+"="+this[children[i]].value+"\n";
		}
		ret+="\nATTRIBUTES: \n";
		for(var s:String in attributes){
			ret+=s+"="+attributes[s]+"\n";
		}
		ret+="\nVALUE:\n";
		ret+=value;
		return ret;
	}
}