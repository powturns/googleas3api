package be.boulevart.google.events {
	/**	 * @author joris	 */	public class GoogleAPIErrorEvent extends Error {		public function GoogleAPIErrorEvent(message = "", id = 0) {			super(message , id);		}
		public function get responseDetails() : String {
			return this.message;
		}
		public function get responseStatus() : int {
			return this.errorID;
		}
	}}
