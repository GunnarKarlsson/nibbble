package helpers
{
	import mx.collections.ArrayCollection;
	
	import valueObjects.PlayerVO;
	import valueObjects.ShotVO;

	public class ShotVOArrayCollectionPopulator{
		public function ShotVOArrayCollectionPopulator(){
		}
		
		public static function execute(decodedJSON:Object):ArrayCollection{
			var obj:Object = decodedJSON;
			var shotVOs:ArrayCollection = new ArrayCollection(new Array());
			
			for(var i:int = 0; i < obj.shots.length;i++){	
				var shotVO:ShotVO = new ShotVO(obj.shots[i].image_teaser_url,obj.shots[i].image_url);
				
				//populate shotVO
				shotVO.id = obj.shots[i].id;
				shotVO.title = obj.shots[i].title;
				shotVO.shortUrl = obj.shots[i].short_url;
				shotVO.width = obj.shots[i].width;
				shotVO.height = obj.shots[i].height;
				shotVO.viewsCount = obj.shots[i].views_count;
				shotVO.likesCount = obj.shots[i].likes_count;
				shotVO.commentsCount = obj.shots[i].comments_count;
				shotVO.reboundsCount = obj.shots[i].rebounds_count;	
				shotVO.reboundsSourceId = obj.shots[i].rebounds_source_id;
				shotVO.createdAt = obj.shots[i].created_at;
				
				//populate shotVO's player Object
					
				var player:Object = obj.shots[i].player as Object;
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
				
				//trace(shotVO.player.username);
				shotVOs.addItem(shotVO);
			}//end loop
			return shotVOs;	
			
		}//end function execute
			
	}//class
}//pkg