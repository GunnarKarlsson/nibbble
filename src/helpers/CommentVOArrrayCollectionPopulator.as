package helpers
{
	import mx.collections.ArrayCollection;
	
	import valueObjects.CommentVO;
	import valueObjects.PlayerVO;

	public class CommentVOArrrayCollectionPopulator
	{
		public function CommentVOArrrayCollectionPopulator()
		{
		}
		
		public static function execute(decodedJSON:Object):ArrayCollection{
			var obj:Object = decodedJSON;
			var commentVOs:ArrayCollection = new ArrayCollection(new Array());
			
			for(var i:int = 0; i < obj.comments.length;i++){
				
				var commentVO:CommentVO = new CommentVO();
				
				commentVO.id = obj.comments[i].id;
				commentVO.body = obj.comments[i].body;
				commentVO.likesCount = obj.comments[i].likes_count;
				commentVO.createdAt = obj.comments[i].createdAt;
				
				var player:Object = obj.comments[i].player as Object;
				commentVO.player = new PlayerVO(player.avatar_url as String);	
				commentVO.player.id 					= player.id as int;
				commentVO.player.name 					= player.name as String;
				commentVO.player.username 				= player.username as String;
				commentVO.player.url 					= player.url as String;
				commentVO.player.location 				= player.location as String;
				commentVO.player.twitterScreenName 	= player.twitter_screen_name as String;
				commentVO.player.draftedByPlayerId 	= player.drafted_by as int;
				commentVO.player.shotsCount 			= player.shots_count as int;
				commentVO.player.drafteesCount 		= player.draftees_count as int;
				commentVO.player.followersCount 		= player.followers_count as int;
				commentVO.player.followingCount 		= player.following_count as int;
				commentVO.player.createdAt 			= player.created_at as String;
				
				commentVOs.addItem(commentVO);
			}//end loop
			return commentVOs;
		}
	}
}