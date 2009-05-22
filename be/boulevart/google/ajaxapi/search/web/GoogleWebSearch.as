/** * GOOGLE API - AS3 LIBRARY * * @author Joris Timmerman *  * GoogleWebSearch - Search the web using Google, uses Google We Search, delivers same results as you would search with the websinterface. * Build by Joris Timmerman, these classes uses the Google Ajax API *  * These classes are using methods and classes from the Adobe Core Libary, downloadable @ http://code.google.com/p/as3corelib/ *  * SPECIAL THANKS TO GOOGLE FOR PROVIDING THE AJAX API * THIS IS AN OPEN SOURCE PROJECT DELIVERED BY BOULEVART NV (www.boulevart.be) */package be.boulevart.google.ajaxapi.search.web {	import be.boulevart.google.ajaxapi.search.GoogleSearchResult;	import be.boulevart.google.ajaxapi.search.web.data.GoogleWebItem;	import be.boulevart.google.apicore.GoogleApiKeyStore;	import be.boulevart.google.events.GoogleApiEvent;		import com.adobe.serialization.json.JSON;	import com.adobe.utils.StringUtil;		import flash.events.Event;	import flash.events.EventDispatcher;	import flash.events.IOErrorEvent;	import flash.net.URLLoader;	import flash.net.URLRequest;		/**	 * @author joris	 */	public class GoogleWebSearch extends EventDispatcher {		/**		 * Start search operation, when operation is done, will dispatch an GoogleSearchEvent.WEB_SEARCH_RESULT event with an array of GoogleWebSearchItem-objects.		 * Will deliver 8 results max, you can get more using the start param. (paging)		 * @param searchString search string, what do you wanna find?		 * @param start sets a start value for paging (fe. 9; delivers search results from result 9 up to 16)		 * @param lang set main language using language code		 */		public function search(searchString : String,start : int = 0,lang : String = "") : void {			var serviceURL : String = 'http://ajax.googleapis.com/ajax/services/search/web';						var loader : URLLoader = new URLLoader()			var query : String = "?"			query += "v=1.0"						if(start > 0) {				query += "&start=" + start			}						if(StringUtil.trim(lang).length > 0) {				query += "&hl=" + lang			}						query += "&rsz=large"			query += "&q=" + searchString						query += GoogleApiKeyStore.apiKeyUrlQuery									var request : URLRequest = new URLRequest(serviceURL + query)						loader.addEventListener(Event .COMPLETE , onResponse)			loader.addEventListener(IOErrorEvent.IO_ERROR , onIOError); 			loader.load(request)		}		private function onResponse(event : Event) : void {			var json : Object = JSON.decode("" + event.target.data);			var results : Array = json.responseData.results as Array			var resultaten : Array = new Array()									for each(var data:Object in results) {				var item : GoogleWebItem = new GoogleWebItem()				item.cacheUrl = data.cacheUrl				item.content = data.content				item.title = data.title				item.titleNoFormatting = data.titleNoFormatting				item.unescapedUrl = data.unescapedUrl				item.url = data.url				item.visibleUrl = data.visibleUrl				resultaten.push(item)			}						var searchItem:GoogleSearchResult=new GoogleSearchResult()			if(json.responseData.cursor.currentPageIndex!=null){				searchItem.currentPageIndex=json.responseData.cursor.currentPageIndex			}			if(json.responseData.cursor.pages!=null){				searchItem.numPages=json.responseData.cursor.pages.length			}			searchItem.results=resultaten						if(json.responseData.cursor.estimatedResultCount!=null){				searchItem.estimatedNumResults=json.responseData.cursor.estimatedResultCount			}						dispatchEvent(new GoogleApiEvent(GoogleApiEvent.WEB_SEARCH_RESULT , searchItem))		}		private function onIOError(event : IOErrorEvent) : void {  			dispatchEvent(new GoogleApiEvent(GoogleApiEvent.ON_ERROR , "IOERROR: " + event.text))		} 	}}