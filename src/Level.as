package
{
	import flash.display.BitmapData;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;

	public class Level extends Entity
	{
		public function Level()
		{
			height = 30;
			width = FP.width;
			x = 0;
			y = FP.height - height;
			type = A.typSOLID;
		}
		
		override public function update():void
		{
			width = FP.camera.x + FP.width * 2;
			graphic = new Image(new BitmapData(width, height, false, 0x887766FF));
			//x = FP.camera.x;
		}
	}
}
