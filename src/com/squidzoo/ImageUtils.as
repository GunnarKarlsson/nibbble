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
		
		public static function rotate(image:Bitmap,degrees:int):Bitmap{
			var matrix:Matrix = new Matrix();
			matrix.translate(-image.bitmapData.width/2,-image.bitmapData.height/2);
			matrix.rotate(degrees*(Math.PI/180));
			matrix.translate(image.bitmapData.height/2,image.bitmapData.width/2);
			var matrixImage:BitmapData = new BitmapData(image.bitmapData.height,image.bitmapData.width,false,0x00000000);
			matrixImage.draw(image,matrix);
			var newBmp:Bitmap = new Bitmap(matrixImage);
			//newBmp.smoothing = true;
			return newBmp;
			
			/*
			var angleInRadians:Number = Math.PI * 2 * (degrees / 360);
			var m:Matrix = new Matrix();
			m.translate(-image.bitmapData.width*0.5,-image.bitmapData.height*0.5);
			m.rotate(angleInRadians);
			m.translate(image.bitmapData.width*0.5,image.bitmapData.height*0.5);
			var newBmd:BitmapData = new BitmapData(image.height,image.width,false,0x000000);
			newBmd.draw(image.bitmapData,m);
			var newBmp:Bitmap = new Bitmap(newBmd);
			newBmp.smoothing = true; 
			return newBmp
			*/ 
		}
		
		public static function addBorder(image:Bitmap,borderSize:int,borderColor:int):Bitmap{
			
			var newBmd:BitmapData = new BitmapData(image.width+borderSize*2, image.height+borderSize*2, false, borderColor);
			var m:Matrix = new Matrix();
			m.translate(borderSize,borderSize);
			newBmd.draw(image.bitmapData,m);
			var newBmp:Bitmap = new Bitmap(newBmd);
			//newBmp.smoothing = true; 
			
			return newBmp; 
		}
		
		public static function scaleToTargetWidth(image:Bitmap,targetContainerWidth:int):Bitmap{
			
			var scaleFactor:Number = targetContainerWidth / image.width; 
			var targetContainerHeight:Number = scaleFactor * image.height;
			
			var scaleParams:Matrix = new Matrix(); 
			scaleParams.scale(scaleFactor,scaleFactor); 
			
			var newBmd:BitmapData = new BitmapData(targetContainerWidth, targetContainerHeight); 
			//draw new bitmapdata with matrix	
			newBmd.draw(image.bitmapData, scaleParams,null,null,null,true);
			//create final bitmap with new bitmapdata 
			var newBmp:Bitmap = new Bitmap(newBmd); 
			//set smooting to true 
			//newBmp.smoothing = true;
			
			return newBmp; 
		}
		
		public static function scaleToTargetHeight(image:Bitmap, targetContainerHeight:int):Bitmap
		{
			var scaleFactor:Number = targetContainerHeight / image.height;
			var targetContainerWidth:Number = scaleFactor * image.width;
			
			var scaleParams:Matrix = new Matrix(); 
			scaleParams.scale(scaleFactor,scaleFactor); 
			
			var newBmd:BitmapData = new BitmapData(targetContainerWidth, targetContainerHeight); 
			//draw new bitmapdata with matrix	
			newBmd.draw(image.bitmapData, scaleParams,null,null,null,true); 
			//create final bitmap with new bitmapdata 
			var newBmp:Bitmap = new Bitmap(newBmd); 
			//set smooting to true 
			//newBmp.smoothing = true; 
			
			return newBmp; 
		}
	}
}