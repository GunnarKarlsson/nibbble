/*******************************************************************************
* Copyright 2011, 2012 Gunnar Karlsson.
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*******************************************************************************/

package helpers
{
	import valueObjects.PlayerVO;
	import valueObjects.ShotVO;

	public class SingleShotVOPopulator
	{
		public function SingleShotVOPopulator()
		{
		}

		public static function execute(decodedJSON:Object):ShotVO
		{
			var obj:Object=decodedJSON;
			var shotVO:ShotVO=new ShotVO(obj.image_teaser_url, obj.image_url);

			//populate shotVO
			shotVO.id=obj.id;
			shotVO.title=obj.title;
			shotVO.shortUrl=obj.short_url;
			shotVO.width=obj.width;
			shotVO.height=obj.height;
			shotVO.viewsCount=obj.views_count;
			shotVO.likesCount=obj.likes_count;
			shotVO.commentsCount=obj.comments_count;
			shotVO.reboundsCount=obj.rebounds_count;
			shotVO.reboundsSourceId=obj.rebounds_source_id;
			shotVO.createdAt=obj.created_at;

			//populate shotVO's player Object

			var player:Object=obj.player as Object;
			shotVO.player=new PlayerVO(player.avatar_url as String);

			shotVO.player.id=player.id as int;
			shotVO.player.name=player.name as String;
			shotVO.player.username=player.username as String;
			shotVO.player.url=player.url as String;
			shotVO.player.location=player.location as String;
			shotVO.player.twitterScreenName=player.twitter_screen_name as String;
			shotVO.player.draftedByPlayerId=player.drafted_by as int;
			shotVO.player.shotsCount=player.shots_count as int;
			shotVO.player.drafteesCount=player.draftees_count as int;
			shotVO.player.followersCount=player.followers_count as int;
			shotVO.player.followingCount=player.following_count as int;
			shotVO.player.commentsCount=player.comments_count as int;
			shotVO.player.commentsReceivedCount=player.comments_received_count as int;
			shotVO.player.likesCount=player.likes_count as int;
			shotVO.player.likesReceivedCount=player.likes_received_count as int;
			shotVO.player.reboundsCount=player.rebounds_count as int;
			shotVO.player.createdAt=player.created_at as String;

			return shotVO;
		}
	}
}
