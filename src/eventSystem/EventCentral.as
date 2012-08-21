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

package eventSystem
{

	import flash.events.*;

	public class EventCentral extends EventDispatcher
	{

		private static var instance:EventCentral;

		public function EventCentral(blocker:SingletonBlocker):void
		{
			super();
			if (blocker == null)
			{
				throw new Error("Error: instantiation failed; Use EventCentral.getInstance()");
			}
		}

		public static function getInstance():EventCentral
		{
			if (instance == null)
			{
				instance=new EventCentral(new SingletonBlocker());
			}
			return instance;
		}

		public override function dispatchEvent(event:Event):Boolean
		{
			return super.dispatchEvent(event);
		}
	}
}

internal class SingletonBlocker
{
}
