package be.boulevart.google.events {

	/**
	 * @author joris
	 */
	public class GoogleAPIErrorEvent extends Error {
		public function GoogleAPIErrorEvent(message:String = "", id:int = 0) {
			super(message , id);
		}

		public function get responseDetails() : String {
			return this.message;
		}

		public function get responseStatus() : int {
			return this.errorID;
		}

		public function toString() : String {
			return 	"Google API Error:: " + message + " (responseStatus: " + errorID + ")\n" + 
					"Please check your search query.\n" +
					"Error-details:";
		}
	}
}

