package comps
{
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	/**
	 * My CustomEvent.
	 */
	public class CustomEvent extends Event
	{
		public static var DATA_LOADED:String = "dataLoaded";
		
		private var _data:ArrayCollection;
		
		public function CustomEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false, data:ArrayCollection=null)
		{
			super(type, bubbles, cancelable);
			_data = data;
		}
		
		public function get data():ArrayCollection
		{
			return _data;
		}
		
		override public function clone():Event
		{
			return new CustomEvent(type, bubbles, cancelable, data);
		}
	}
}