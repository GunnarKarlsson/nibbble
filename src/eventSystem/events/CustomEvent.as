package eventSystem.events
{
	import flash.events.Event;

	public class CustomEvent extends Event {
		public static const NEW_SHOT_BOOKMARK:String = "New Shot Bookmark";
		public static const CONFIRMATION_NEW_SHOT_BOOKMARK_CREATED:String = "Confirmation new shoot bookmark created";
		public static const CONFIRMATION_NEW_PLAYER_BOOKMARK_CREATED:String = "Confirmation new player bookmark created";
		public static const NEW_PLAYER_BOOKMARK:String = "New Player Bookmark";
		public static const REQUEST_TO_REMOVE_SHOT_BOOKMARK:String = "Remove Shot Bookmark";
		public static const REQUEST_TO_REMOVE_PLAYER_BOOKMARK:String = "Remove Player Bookmark";
		public static const CONFIRMATION_SHOT_BOOKMARK_REMOVED:String = "Confirmation Shot Bookmark Removed";
		public static const CONFIRMATION_PLAYER_BOOKMARK_REMOVED:String = "Confirmation Player Bookmark Removed";	
		public static const IS_SHOT_BOOKMARKED_QUERY:String = "Is Shot Bookmarked Query";
		public static const IS_PLAYER_BOOKMARKED_QUERY:String = "Is Player Bookmarked Query";
		public static const IS_SHOT_BOOKMARKED_RESPONSE:String = "Is Shot Bookmarked Response";
		public static const IS_PLAYER_BOOKMARKED_RESPONSE:String = "Is Player Bookmarked Resposne";
		public static const REQUEST_FOR_BOOKMARKED_SHOTS_FROM_REPOSITORY:String = "Request for bookmarked shots from repository";
		public static const DISPATCH_OF_BOOKMARKED_SHOTS_FROM_REPOSITORY:String = "Dispatch of bookmarked shots from repository";
		public static const IMAGE_LIST_READY:String = "Image list ready";
		
		public static const ACTIONBAR_MENU_ICON_CLICKED_POPULAR_SELECTED:String = "Actionbar Menu icon clicked popular selected";
		public static const ACTIONBAR_MENU_ICON_CLIKED_EVERYBODY_SELECTED:String = "Actionbar Menu icon clicked everybody selected";
		public static const ACTIONBAR_MENU_ICON_CLICKED_DEBUTS_SELECTED:String = "Actionbar Menu icon clicked debuts selected";
		public static const ACTION_BAR_MENU_ICON_CLICKED_BOOKMARKS_SELECTED:String = "Actionbar Menu icon clicked bookmarks selected";
		public static const ACTION_BAR_MENU_ICON_CLICKED_ABOUT_SELECTED:String = "Actionbar Menu icon clicked about selected";
		
		public var id:int;
		public var isBookmarked:Boolean;
		public var data:Array;
		
		public function CustomEvent(type:String,id:int=-1, isBookmarked:Boolean = false, data:Array = null):void {
			super(type);
			this.id = id;
			this.isBookmarked = isBookmarked;
			this.data = data;
		}
	}
}