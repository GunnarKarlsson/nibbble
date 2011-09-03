package valueObjects
{
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.net.URLRequest;

	[Bindable]
	public class PlayerVO
	{
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
	}
}