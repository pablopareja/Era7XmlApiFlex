package com.era7.xmlapi.model
{
	public class XMLObject
	{			
		protected var content:XML = null;
		
		
		/**
		 * 	CONSTRUCTOR
		 */
		public function XMLObject(value:*)
		{
			
			if(value is XML){		
				
				this.content = XML(value).copy();						
				
			}else if(value is String){
				
				try{
					this.content = new XML(String(value));	
					
				}catch(e:Error){
					throw new XMLError(XMLError.WRONG_XML_FORMAT_ERROR);
				}			
				
			}else{
				throw new Error("Wrong parameter type for the constructor");
			} 
			
		}
		
		/**
		 * 	Set content
		 */
		protected function setContent(value:XML):void{			
			this.content = value;						
		}
		
		/**
		 *  Get content
		 */
		public function getContent():XML{
			return this.content;
		}
		
		protected function setAttributeText(name:String,value:String):void{
			content.attribute(name)[0] = value;	
		}
		protected function setTagText(tagName:String,value:String):void{
			content.child(tagName)[0] = XMLObject.CDATA(tagName,value);
		}
		
		protected function getAttributeText(name:String):String{
			return content.attribute(name).toString();
		}
		protected function getTagText(name:String):String{
			var temp:XML = content.child(name)[0];	
			if(temp == null){
				return "";
			}else{
				return temp.toString();
			}			
		}
		
		protected function setXMLChild(value:XML):void{
			delete content.child(value.name())[0];
			content.appendChild(value);
		}
		
		/**
		 * 	CDATA
		 */
		public static function CDATA(tagName:String, cdataText:String,nameSpace:Namespace=null) : XML
    	{
    		if(nameSpace == null){
    			return <{tagName}>{new XML("<![CDATA["+cdataText+"]]>")}</{tagName}>;
    		}else{
    			var temp:XML = <{tagName}>{new XML("<![CDATA["+cdataText+"]]>")}</{nameSpace}>;
    			temp.setNamespace(nameSpace);
    			return temp;
    		}
       	 	
    	}
    	
    	/**
    	 * 	TO STRING
    	 */
    	public function toString():String{
   			return this.content.toXMLString();
    	} 
    	
    	
    	/**
    	 * 	REMOVE CDATA TAG
    	 */
    	public static function removeCDATATag(value:String):String{    		
			value = value.replace("]]>","");
			value = value.replace("<![CDATA[","");
			return value;
    	}
    	 	

	}
}