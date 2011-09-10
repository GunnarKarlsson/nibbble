package valueObjects
{
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.net.URLRequest;
	
	import interfaces.IViewDataObject;

	[Bindable]
	public class PlayerVO implements IViewDataObject
	{
		public static const SINGLE_PLAYERS_SHOTS_VIEW:String = "Single Player Shots View";
		
		public var id:int;
		public var name:String;
		public var username:String; 
		public var url:String;
		private var _avatarUrl:String; 
		public var location:String;
		public var twitterScreenName:String;
		public var draftedByPlayerId:int; 
		public var shotsCount:int; 
		public var drafteesCount:int;
		public var followersCount:int; 
		public var followingCount:int;
		public var commentsCount:int;
		public var commentsReceivedCount:int;
		public var likesCount:int; 
		public var likesReceivedCount:int;
		public var reboundsCount:int;
		public var reboundsReceivedCount:int;
		public var createdAt:String;
		
		private var _viewType:String;
		
		public var avatarImage:Bitmap;
		
		public function PlayerVO(avatarUrl:String){
				_avatarUrl = avatarUrl;
				loadAvatarImage();
			}
	
		private function loadAvatarImage():void{
			var imageRequest:URLRequest = new URLRequest(_avatarUrl);
			var loader:Loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE,assignTeaserImage);
			loader.load(imageRequest);
		}
	
		private function assignTeaserImage(event:Event):void{
			avatarImage = event.currentTarget.content as Bitmap;
		}
		
		public function getViewType():String
		{
			return _viewType;
		}
		
		public function setViewType(value:String):void
		{
			_viewType=value;
		}
		
		
	}
}