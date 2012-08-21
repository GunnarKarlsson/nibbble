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

	import valueObjects.CommentVO;
	import valueObjects.PlayerVO;

	public class CommentVOArrrayCollectionPopulator
	{

		public static function execute(decodedJSON:Object):ArrayCollection
		{
			var obj:Object=decodedJSON;
			var commentVOs:ArrayCollection=new ArrayCollection(new Array());

			for (var i:int=0; i < obj.comments.length; i++)
			{

				var commentVO:CommentVO=new CommentVO();

				commentVO.id=obj.comments[i].id;
				commentVO.body=obj.comments[i].body;
				commentVO.likesCount=obj.comments[i].likes_count;
				commentVO.createdAt=obj.comments[i].createdAt;

				var player:Object=obj.comments[i].player as Object;
				commentVO.player=new PlayerVO(player.avatar_url as String);
				commentVO.player.id=player.id as int;
				commentVO.player.name=player.name as String;
				commentVO.player.username=player.username as String;
				commentVO.player.url=player.url as String;
				commentVO.player.location=player.location as String;
				commentVO.player.twitterScreenName=player.twitter_screen_name as String;
				commentVO.player.draftedByPlayerId=player.drafted_by as int;
				commentVO.player.shotsCount=player.shots_count as int;
				commentVO.player.drafteesCount=player.draftees_count as int;
				commentVO.player.followersCount=player.followers_count as int;
				commentVO.player.followingCount=player.following_count as int;
				commentVO.player.createdAt=player.created_at as String;

				commentVOs.addItem(commentVO);
			}
			return commentVOs;
		}
	}
}
