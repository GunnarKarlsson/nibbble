package valueObjects
{
	import flash.display.Bitmap;
	
	import interfaces.IViewDataObject;

	[Bindable]
	public class CommentVO implements IViewDataObject
	{
		public var id:int;
		public var body:String;
		public var likesCount:int;
		public var createdAt:String;
		public var player:PlayerVO;
		public var commentedPlayer:String;
		public var shotImage:Bitmap;
		public var title:String;
		
		private var _viewType:String;
		
		public function CommentVO()
		{
		}
		
		public function getViewType():String{
			return _viewType;
		}
		
		public function setViewType(value:String):void{
			_viewType = value;
		}
	}
}