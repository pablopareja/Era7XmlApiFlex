package com.era7.xmlapi.model
{
	public class XMLError extends Error
	{
		
		public static const WRONG_XML_FORMAT_ERROR:String = "Wrong xml format";
		public static const WRONG_TAG_NAME_ERROR:String = "Wrong tag name";
		public static const TOO_MANY_PARAMETERS_FOR_THE_CONSTRUCTOR:String = "Too many parameters for the constructor!";
		
		/**
		 * 	CONSTRUCTOR
		 */
		public function XMLError(message:String="", id:int=0)
		{
			super(message, id);
		}
		
	}
}