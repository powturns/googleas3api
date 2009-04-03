/**
 * GOOGLE SEARCH AS3 Library
 * 
 * @author Joris Timmerman
 * @version 1.0
 * 
 * GoogleWeatherEvent - Events thrown on result
 * Build by Joris Timmerman

 * SPECIAL THANKS TO GOOGLE FOR PROVIDING THE WEATHER API
 * THIS IS AN OPEN SOURCE PROJECT DELIVERED BY BOULEVART NV (www.boulevart.be)
 */
package be.boulevart.google.events
{
	import flash.events.Event;

	public class GoogleWeatherEvent extends Event
	{
		
		public static const WEATHER_RESULT:String = "weatherResults";
		public static const API_ERROR:String = "onError";
		public static const IO_ERROR:String = "onIOError";
		
		public var data:Object;
		
		public function GoogleWeatherEvent(type:String,data:Object=null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.data=data;
		}
		
	}
}