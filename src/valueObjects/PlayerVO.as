/******************************************************************************
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

package valueObjects
{
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.net.URLRequest;

	import interfaces.IViewDataObject;

	[Bindable]
	public class PlayerVO implements IViewDataObject
	{
		public static const SINGLE_PLAYERS_SHOTS_VIEW:String="Single Player Shots View";
		public static const FOLLOWING:String="following";
		public static const FOLLOWERS:String="followers";
		public static const LIKES:String="likes";


		public var id:int;
		public var name:String;
		public var username:String;
		public var url:String;
		private var _avatarUrl:String;
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

		private var _viewType:String;

		public var avatarImage:Bitmap;

		public function PlayerVO(avatarUrl:String)
		{
			_avatarUrl=avatarUrl;
			loadAvatarImage();
		}

		private function loadAvatarImage():void
		{
			var imageRequest:URLRequest=new URLRequest(_avatarUrl);
			var loader:Loader=new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, assignTeaserImage);
			loader.load(imageRequest);
		}

		private function assignTeaserImage(event:Event):void
		{
			avatarImage=event.currentTarget.content as Bitmap;
		}

		public function getViewType():String
		{
			return _viewType;
		}

		public function setViewType(value:String):void
		{
			_viewType=value;
		}
	}
}
