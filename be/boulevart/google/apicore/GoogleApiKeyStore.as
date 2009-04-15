/**
 * GOOGLE API - AS3 LIBRARY
 * 
 * @author Joris Timmerman
 * @version 2.0
 * 
 * GoogleApiKeyStore - If you have a Google API key, filled it in here
 * Build by Joris Timmerman, these classes uses the Google API
 * 
 * These classes are using methods and classes from the Adobe Core Libary, downloadable @ http://code.google.com/p/as3corelib/
 * 
 * SPECIAL THANKS TO GOOGLE FOR PROVIDING THE API
 * THIS IS AN OPEN SOURCE PROJECT DELIVERED BY BOULEVART NV (www.boulevart.be)
 * */

package be.boulevart.google.apicore {
	public class GoogleApiKeyStore {
		//- PRIVATE & PROTECTED VARIABLES -------------------------------------------------------------------------

		
		
		//- PUBLIC & INTERNAL VARIABLES ---------------------------------------------------------------------------
		public static const API_KEY : String = "ABQIAAAAJjoQAkGmq5qsa0PKk9Y6nxQdF2TG78juI7gyCxAZXlcasg4lQxTlaYHDB6IKUESWIPTqiJvXPeiwhg"
		//- CONSTRUCTOR	-------------------------------------------------------------------------------------------
	
		//- PRIVATE & PROTECTED METHODS ---------------------------------------------------------------------------
		
		
		
		//- PUBLIC & INTERNAL METHODS -----------------------------------------------------------------------------
		public static function get apiKeyUrlQuery() : String {
			if(API_KEY == "") {
				return "";
			}else {
				return "&key=" + API_KEY;
			}
		}
		//- EVENT HANDLERS ----------------------------------------------------------------------------------------
	
		
	
		//- GETTERS & SETTERS -------------------------------------------------------------------------------------
	
		
	
		//- HELPERS -----------------------------------------------------------------------------------------------
		public function toString() : String {
			return "be.boulevart.google.apicore.GoogleApiKeyStore";
		}
	
//- END CLASS ---------------------------------------------------------------------------------------------
	}
}