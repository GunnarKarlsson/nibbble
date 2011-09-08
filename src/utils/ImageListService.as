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
	
	public class ImageListService extends EventDispatcher{
		private var _service:HTTPService = new HTTPService();
		private var _shotVOs:ArrayCollection = new ArrayCollection(new Array);
		private var _listLength:int = 0;
		
		public function ImageListService(target:IEventDispatcher=null){
			super(target);
		}
		
		public function execute(list:Array):void{
			trace("ils execute");
			var idList:Array = list;
			_listLength = list.length;
			
			for(var i:int = 0;i < idList.length;i++){
				_service.url = "http://api.dribbble.com/shots/"+idList[i];
				_service.addEventListener(ResultEvent.RESULT,onServiceResult);
				_service.send();
			}
		}
		
		private function onServiceResult(event:ResultEvent):void{
			trace("ils onserviceresult");
			var obj:Object = JSON.decode(_service.lastResult.toString());
			//here: code to populate shotVOs with data and image bitmaps.
			var shotVO:ShotVO = SingleShotVOPopulator.execute(obj);
			_shotVOs.addItem(shotVO);
			
			trace("_shotVOs.length: "+_shotVOs.length);
			trace("_listLength: "+_listLength);
			
			if(_shotVOs.length == _listLength){
				trace("ils dispatching...");
				EventCentral.getInstance().dispatchEvent(new CustomEvent(CustomEvent.IMAGE_LIST_READY));
			}
		}
		
		public function getImageList():ArrayCollection{
			return _shotVOs;
		}
	}
}