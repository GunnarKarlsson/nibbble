
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

package utils
{
	import com.adobe.serialization.json.JSON;

	import eventSystem.EventCentral;
	import eventSystem.events.CustomEvent;

	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;

	import helpers.SingleShotVOPopulator;

	import mx.collections.ArrayCollection;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	import valueObjects.ShotVO;

	public class ImageListService extends EventDispatcher
	{
		private var _service:HTTPService=new HTTPService();
		private var _shotVOs:ArrayCollection=new ArrayCollection(new Array);
		private var _listLength:int=0;

		public function ImageListService(target:IEventDispatcher=null)
		{
			super(target);
		}

		public function execute(list:Array):void
		{
			var idList:Array=list;
			_listLength=list.length;

			for (var i:int=0; i < idList.length; i++)
			{
				_service.url="http://api.dribbble.com/shots/" + idList[i];
				_service.addEventListener(ResultEvent.RESULT, onServiceResult);
				_service.send();
			}
		}

		private function onServiceResult(event:ResultEvent):void
		{
			var obj:Object=JSON.decode(_service.lastResult.toString());
			var shotVO:ShotVO=SingleShotVOPopulator.execute(obj);
			_shotVOs.addItem(shotVO);

			if (_shotVOs.length == _listLength)
			{
				EventCentral.getInstance().dispatchEvent(new CustomEvent(CustomEvent.IMAGE_LIST_READY));
			}
		}

		public function getImageList():ArrayCollection
		{
			return _shotVOs;
		}
	}
}
