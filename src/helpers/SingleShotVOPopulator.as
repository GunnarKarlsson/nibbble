package helpers
{
	import valueObjects.PlayerVO;
	import valueObjects.ShotVO;

	public class SingleShotVOPopulator
	{
		public function SingleShotVOPopulator(){
		}
		
		public static function execute(decodedJSON:Object):ShotVO{
			var obj:Object = decodedJSON;
			var shotVO:ShotVO = new ShotVO(obj.image_teaser_url,obj.image_url);
			
			//populate shotVO
			shotVO.id = obj.id;
			shotVO.title = obj.title;
			shotVO.shortUrl = obj.short_url;
			shotVO.width = obj.width;
			shotVO.height = obj.height;
			shotVO.viewsCount = obj.views_count;
			shotVO.likesCount = obj.likes_count;
			shotVO.commentsCount = obj.comments_count;
			shotVO.reboundsCount = obj.rebounds_count;	
			shotVO.reboundsSourceId = obj.rebounds_source_id;
			shotVO.createdAt = obj.created_at;
			
			//populate shotVO's player Object
			
			var player:Object = obj.player as Object;
			shotVO.player = new PlayerVO(player.avatar_url as String);	
			
			shotVO.player.id 					= player.id as int;
			shotVO.player.name 					= player.name as String;
			shotVO.player.username 				= player.username as String;
			shotVO.player.url 					= player.url as String;
			shotVO.player.location 				= player.location as String;
			shotVO.player.twitterScreenName 	= player.twitter_screen_name as String;
			shotVO.player.draftedByPlayerId 	= player.drafted_by as int;
			shotVO.player.shotsCount 			= player.shots_count as int;
			shotVO.player.drafteesCount 		= player.draftees_count as int;
			shotVO.player.followersCount 		= player.followers_count as int;
			shotVO.player.followingCount 		= player.following_count as int;
			shotVO.player.commentsCount 		= player.comments_count as int;
			shotVO.player.commentsReceivedCount = player.comments_received_count as int;
			shotVO.player.likesCount 			= player.likes_count as int;
			shotVO.player.likesReceivedCount 	= player.likes_received_count as int;
			shotVO.player.reboundsCount 		= player.rebounds_count as int;
			shotVO.player.createdAt 			= player.created_at as String;
			
			return shotVO;
		}
	}
}