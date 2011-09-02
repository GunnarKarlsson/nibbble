package valueObjects
{
	[Bindable]
	public class PlayerVO
	{
		public var id:int;
		public var name:String;
		public var username:String; 
		public var url:String;
		public var avatarUrl:String; 
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
		
		public function PlayerVO()
		{
		}
	}
}