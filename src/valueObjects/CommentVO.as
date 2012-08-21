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
	import spark.filters.DropShadowFilter;

	import interfaces.IViewDataObject;

	[Bindable]
	public class CommentVO implements IViewDataObject
	{
		public var id:int;
		public var body:String;
		public var likesCount:int;
		public var createdAt:String;
		public var player:PlayerVO;
		public var commentedPlayer:String;
		public var shotImage:Bitmap;
		public var title:String;
		public var filter:DropShadowFilter;

		private var _viewType:String;

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
