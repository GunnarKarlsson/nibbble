package valueObjects
{
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.net.URLRequest;

	[Bindable]
	public class ShotVO
	{		
		public var id:int;
		public var title:String;
		public var shortUrl:String;
		private var _imageTeaserUrl:String;
		private var _imageUrl:String;
		public var width:int;
		public var height:int;
		public var viewsCount:int;
		public var likesCount:int;
		public var commentsCount:int;
		public var reboundsCount:int;
		public var reboundsSourceId:int;
		public var createdAt:String;
		public var player:PlayerVO;
		public var bookmarked:Boolean;
		
		public var teaserImage:Bitmap;
		public var image:Bitmap;
		
		public function ShotVO(imageTeaserUrl:String,imageUrl:String)
		{
			_imageTeaserUrl = imageTeaserUrl;
			_imageUrl = imageUrl;
			
			loadTeaserImage();
			loadImage();
		}
		
		private function loadTeaserImage():void{
			var imageRequest:URLRequest = new URLRequest(_imageTeaserUrl);
			var loader:Loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE,assignTeaserImage);
			loader.load(imageRequest);
		}
	
		private function assignTeaserImage(event:Event):void{
			teaserImage = event.currentTarget.content as Bitmap;
		}
		
		private function loadImage():void{
			var imageRequest:URLRequest = new URLRequest(_imageUrl);
			var loader:Loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE,assignImage);
			loader.load(imageRequest);
		}
		
		private function assignImage(event:Event):void{
			image = event.currentTarget.content as Bitmap;
		}
	}
}