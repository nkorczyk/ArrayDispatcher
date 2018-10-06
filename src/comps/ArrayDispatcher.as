package comps
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public dynamic class ArrayDispatcher extends Array implements IEventDispatcher
	{
		private var _dispatcher:EventDispatcher;
		public function ArrayDispatcher(...parameters)
		{
			super(parameters);
			var i:int, len:int;
			if (parameters.length == 1)
			{
				len = parameters[0];
				for (i = 0; i < len; i++) 
					this[i] = "";
			}
			else
			{
				len = parameters.length;
				for (i = 0; i < len; i++) 
					this[i] = parameters[i];
			}
			_dispatcher = new EventDispatcher();
		}
		
		public function addEventListener(type:String, listener:Function, useCapture:Boolean=false, priority:int=0, useWeakReference:Boolean=false):void
		{
			_dispatcher.addEventListener(type, listener, useCapture, priority, useWeakReference);
		}
		
		public function removeEventListener(type:String, listener:Function, useCapture:Boolean=false):void
		{
			_dispatcher.removeEventListener(type, listener, useCapture);
		}
		
		public function dispatchEvent(event:Event):Boolean
		{
			return _dispatcher.dispatchEvent(event);
		}
		
		public function hasEventListener(type:String):Boolean
		{
			return _dispatcher.hasEventListener(type);
		}
		
		public function willTrigger(type:String):Boolean
		{
			return _dispatcher.willTrigger(type);
		}
	}
}