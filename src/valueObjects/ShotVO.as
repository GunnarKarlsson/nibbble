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

	import com.squidzoo.ImageUtils;

	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.net.URLRequest;

	import mx.core.FlexGlobals;

	import spark.primitives.BitmapImage;

	[Bindable]
	public class ShotVO
	{
		public var id:int;
		public var title:String;
		public var shortUrl:String;
		private var _imageTeaserUrl:String;
		private var _imageUrl:String;
		public var width:int;
		public var height:int;
		public var viewsCount:int;
		public var likesCount:int;
		public var commentsCount:int;
		public var reboundsCount:int;
		public var reboundsSourceId:int;
		public var createdAt:String;
		public var player:PlayerVO;
		public var bookmarked:Boolean;

		public var teaserImage:Bitmap;
		public var image:Bitmap;

		public var _targetWidth:int=FlexGlobals.topLevelApplication.stage.stageWidth * 0.9;

		public function ShotVO(imageTeaserUrl:String, imageUrl:String)
		{
			_imageTeaserUrl=imageTeaserUrl;
			_imageUrl=imageUrl;

			loadTeaserImage();
			loadImage();
		}

		private function loadTeaserImage():void
		{
			var imageRequest:URLRequest=new URLRequest(_imageTeaserUrl);
			var loader:Loader=new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, assignTeaserImage);
			loader.load(imageRequest);
		}

		private function assignTeaserImage(event:Event):void
		{
			teaserImage=event.currentTarget.content as Bitmap;
		}

		private function loadImage():void
		{
			var imageRequest:URLRequest=new URLRequest(_imageUrl);
			var loader:Loader=new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, assignImage);
			loader.load(imageRequest);
		}

		private function assignImage(event:Event):void
		{
			var img:Bitmap=event.currentTarget.content as Bitmap;
			image=img;
		}
	}
}
