package valueObjects
{
	[Bindable]
	public class CommentVO
	{
		public var id:int;
		public var body:String;
		public var likesCount:int;
		public var createdAt:String;
		public var player:PlayerVO;		
		
		public function CommentVO()
		{
		}
	}
}