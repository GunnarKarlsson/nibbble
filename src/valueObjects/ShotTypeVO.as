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
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;

	import interfaces.IViewDataObject;

	public class ShotTypeVO extends EventDispatcher implements IViewDataObject
	{
		public static const MULTIPLE_PLAYERS_SHOTS_VIEW:String="Multiple Players Shots View";
		public static const BOOKMARKED_SHOTS:String="Bookmarked shots";

		public var _shotCollectionType:String;

		private var _viewType:String;

		public function getViewType():String
		{
			return _viewType;
		}

		public function setViewType(value:String):void
		{
			_viewType=value;
		}

		public function setShotCollectionType(value:String):void
		{
			_shotCollectionType=value;
		}

		public function getShotCollectionType():String
		{
			return _shotCollectionType;
		}
	}
}
