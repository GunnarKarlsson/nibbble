package valueObjects
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;

	import interfaces.IViewDataObject;

	public class ShotTypeVO extends EventDispatcher implements IViewDataObject
	{
		public static const MULTIPLE_PLAYERS_SHOTS_VIEW:String="Multiple Players Shots View";

		public var _shotCollectionType:String;

		private var _viewType:String;

		public function ShotTypeVO()
		{
		}

		public function getViewType():String
		{
			return _viewType;
		}

		public function setViewType(value:String):void
		{
			_viewType=value;
		}

		public function setShotCollectionType(value:String):void
		{
			_shotCollectionType=value;
		}

		public function getShotCollectionType():String
		{
			return _shotCollectionType;
		}
	}
}
