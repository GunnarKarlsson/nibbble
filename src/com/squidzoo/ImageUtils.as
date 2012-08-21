
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

package com.squidzoo
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.filters.BlurFilter;
	import flash.geom.Matrix;

	public class ImageUtils
	{

		public function ImageUtils()
		{
		}

		public static function rotate(image:Bitmap, degrees:int):Bitmap
		{
			var matrix:Matrix=new Matrix();
			matrix.translate(-image.bitmapData.width / 2, -image.bitmapData.height / 2);
			matrix.rotate(degrees * (Math.PI / 180));
			matrix.translate(image.bitmapData.height / 2, image.bitmapData.width / 2);
			var matrixImage:BitmapData=new BitmapData(image.bitmapData.height, image.bitmapData.width, false, 0x00000000);
			matrixImage.draw(image, matrix);
			var newBmp:Bitmap=new Bitmap(matrixImage);
			return newBmp;
		}

		public static function addBorder(image:Bitmap, borderSize:int, borderColor:int):Bitmap
		{

			var newBmd:BitmapData=new BitmapData(image.width + borderSize * 2, image.height + borderSize * 2, false, borderColor);
			var m:Matrix=new Matrix();
			m.translate(borderSize, borderSize);
			newBmd.draw(image.bitmapData, m);
			var newBmp:Bitmap=new Bitmap(newBmd);

			return newBmp;
		}

		public static function scaleToTargetWidth(image:Bitmap, targetContainerWidth:int):Bitmap
		{

			var scaleFactor:Number=targetContainerWidth / image.width;
			var targetContainerHeight:Number=scaleFactor * image.height;

			var scaleParams:Matrix=new Matrix();
			scaleParams.scale(scaleFactor, scaleFactor);

			var newBmd:BitmapData=new BitmapData(targetContainerWidth, targetContainerHeight);
			newBmd.draw(image.bitmapData, scaleParams, null, null, null, true);
			var newBmp:Bitmap=new Bitmap(newBmd);

			return newBmp;
		}

		public static function scaleToTargetHeight(image:Bitmap, targetContainerHeight:int):Bitmap
		{
			var scaleFactor:Number=targetContainerHeight / image.height;
			var targetContainerWidth:Number=scaleFactor * image.width;

			var scaleParams:Matrix=new Matrix();
			scaleParams.scale(scaleFactor, scaleFactor);

			var newBmd:BitmapData=new BitmapData(targetContainerWidth, targetContainerHeight);
			newBmd.draw(image.bitmapData, scaleParams, null, null, null, true);
			var newBmp:Bitmap=new Bitmap(newBmd);

			return newBmp;
		}
	}
}
