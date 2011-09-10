package valueObjects
{
	import flash.events.EventDispatcher;

	[Bindable]
	public class MenuItemVO extends EventDispatcher
	{
		public static const POPULAR:String = "popular";
		public static const EVERYONE:String = "everyone";
		public static const DEBUTS:String = "debuts";
		public static const BOOKMARKS:String = "bookmarks";
		public static const SEARCH:String = "search";
		public static const ABOUT_NIBBLE:String = "about";
		public static const MULTIPLE_PLAYERS_SHOTS_VIEW:String="multiple players shots view";
		public static const BOOKMARKED_SHOTS:String = "bookmarked shots";
		
		public var _title:String;
		public var _viewType:String;			
		
		public function MenuItemVO(title:String=null,viewType:String=null)
		{
			_title = title;
			_viewType = viewType;
		}
		
		public function getViewType():String{
			return _viewType;
		}
		
		public function setViewType(value:String):void{
			_viewType = value;
		}
		
		public function getTitle():String{
			return _title;	
		}
		
		public function setTitle(value:String):void{
			_title = value;
		}
	}
}