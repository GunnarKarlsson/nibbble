package utils
{
	import adobe.utils.CustomActions;
	
	import eventSystem.EventCentral;
	import eventSystem.events.CustomEvent;
	
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import spark.managers.PersistenceManager;
	
	public class BookmarkRepository extends EventDispatcher
	{
		private var _shotBookmarks:Array;
		private var _playerBookmarks:Array;
		
		public function BookmarkRepository(target:IEventDispatcher=null)
		{
			_shotBookmarks = new Array();
			_playerBookmarks = new Array();
			
			EventCentral.getInstance().addEventListener(CustomEvent.IS_SHOT_BOOKMARKED_QUERY, onShotBookmarkStatusQuery);
			EventCentral.getInstance().addEventListener(CustomEvent.NEW_SHOT_BOOKMARK, onNewShotBookmark);
			EventCentral.getInstance().addEventListener(CustomEvent.REQUEST_TO_REMOVE_SHOT_BOOKMARK, onRemoveShotbookmark);
			EventCentral.getInstance().addEventListener(CustomEvent.REQUEST_FOR_BOOKMARKED_SHOTS_FROM_REPOSITORY, onRequestForBookmarkedShots);
			
			super(target);	
		}
		
		public function getSavedBookmarks():void{
			//TODO
			
			trace("load on start");
			var p:PersistenceManager = new PersistenceManager();
			var obj:Object = p.getProperty("bookmarks");
			if(obj)_shotBookmarks = obj.data;
		}
		
		public function saveBookmarks():void{
			//TODO
			
			trace("save on exit");
			var p:PersistenceManager = new PersistenceManager();
			var obj:Object = new Object();
			obj.data = _shotBookmarks;
			p.setProperty("bookmarks", obj);
		}
		
		private function onRequestForBookmarkedShots(event:CustomEvent):void{
			EventCentral.getInstance().dispatchEvent(new CustomEvent(CustomEvent.DISPATCH_OF_BOOKMARKED_SHOTS_FROM_REPOSITORY,-1,false,_shotBookmarks));
		}
		
		private function onRemoveShotbookmark(event:CustomEvent):void{
			trace("bmr onRemoveShotbookmark");
			for(var i:int = 0; i < _shotBookmarks.length;i++){
				if(event.id == _shotBookmarks[i])_shotBookmarks.splice(i,1);
			}
			
			EventCentral.getInstance().dispatchEvent(new CustomEvent(CustomEvent.CONFIRMATION_SHOT_BOOKMARK_REMOVED,event.id));
		}
		
		private function onNewShotBookmark(event:CustomEvent):void{
			trace("BookmarkRepo: onNewShotBookmark");
			var newId:int = event.id;
			
			for(var i:int = 0; i < _shotBookmarks.length;i++){
				if(newId == _shotBookmarks[i])return;
			}
			
			_shotBookmarks.push(newId);
			
			EventCentral.getInstance().dispatchEvent(new CustomEvent(CustomEvent.CONFIRMATION_NEW_SHOT_BOOKMARK_CREATED,event.id));
		}
		
		private function onShotBookmarkStatusQuery(event:CustomEvent):void{
			var queriedId:int = event.id;
			var response:Boolean = false;
			
			for(var i:int = 0; i < _shotBookmarks.length;i++){
				if(queriedId == _shotBookmarks[i])response = true;
				
			}
			EventCentral.getInstance().dispatchEvent(new CustomEvent(CustomEvent.IS_SHOT_BOOKMARKED_RESPONSE,event.id,response));
		}
		
	
		 
	}
}