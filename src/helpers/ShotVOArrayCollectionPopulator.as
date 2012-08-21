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
	import mx.collections.ArrayCollection;

	import valueObjects.PlayerVO;
	import valueObjects.ShotVO;

	public class ShotVOArrayCollectionPopulator
	{
		public function ShotVOArrayCollectionPopulator()
		{
		}

		public static function execute(decodedJSON:Object):ArrayCollection
		{
			var obj:Object=decodedJSON;
			var shotVOs:ArrayCollection=new ArrayCollection(new Array());

			for (var i:int=0; i < obj.shots.length; i++)
			{
				var shotVO:ShotVO=new ShotVO(obj.shots[i].image_teaser_url, obj.shots[i].image_url);

				//populate shotVO
				shotVO.id=obj.shots[i].id;
				shotVO.title=obj.shots[i].title;
				shotVO.shortUrl=obj.shots[i].short_url;
				shotVO.width=obj.shots[i].width;
				shotVO.height=obj.shots[i].height;
				shotVO.viewsCount=obj.shots[i].views_count;
				shotVO.likesCount=obj.shots[i].likes_count;
				shotVO.commentsCount=obj.shots[i].comments_count;
				shotVO.reboundsCount=obj.shots[i].rebounds_count;
				shotVO.reboundsSourceId=obj.shots[i].rebounds_source_id;
				shotVO.createdAt=obj.shots[i].created_at;

				//populate shotVO's player Object

				var player:Object=obj.shots[i].player as Object;
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

				shotVOs.addItem(shotVO);
			}
			return shotVOs;

		}

	}
}
