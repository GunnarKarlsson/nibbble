package helpers
{
	import mx.collections.ArrayCollection;
	
	import valueObjects.PlayerVO;
	import valueObjects.ShotVO;

	public class PlayerVOArrayCollectionPopulator{
		
		public function PlayerVOArrayCollectionPopulator(){
		}
		
		public static function execute(decodedJSON:Object):ArrayCollection{
			var obj:Object = decodedJSON;
			var playerVOs:ArrayCollection = new ArrayCollection(new Array());
			
			for(var i:int = 0; i < obj.players.length;i++){	
				var vo:PlayerVO = new PlayerVO(obj.players[i].avatar_url as String);

				vo.id 						= obj.players[i].id as int;
				vo.name 					= obj.players[i].name as String;
				vo.username 				= obj.players[i].username as String;
				vo.url 						= obj.players[i].url as String;
				vo.twitterScreenName 		= obj.players[i].twitter_screen_name as String;
				vo.draftedByPlayerId 		= obj.players[i].drafted_by as int;
				vo.shotsCount 				= obj.players[i].shots_count as int;
				vo.drafteesCount 			= obj.players[i].draftees_count as int;
				vo.followersCount 			= obj.players[i].followers_count as int;
				vo.followingCount 			= obj.players[i].following_count as int;
				vo.commentsCount 			= obj.players[i].comments_count as int;
				vo.commentsReceivedCount 	= obj.players[i].comments_received_count as int;
				vo.likesCount 				= obj.players[i].likes_count as int;
				vo.likesReceivedCount 		= obj.players[i].likes_received_count as int;
				vo.reboundsCount 			= obj.players[i].rebounds_count as int;
				vo.createdAt 				= obj.players[i].created_at as String;
				
				//trace(shotVO.player.username);
				playerVOs.addItem(vo);
			}//end loop
			return playerVOs;	
			
		}//end function execute
			
	}//class
}//pkg