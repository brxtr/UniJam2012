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
			height = 40;
			width = FP.width*6;
			x = 0;
			y = FP.height - height;
			type = A.typSOLID;

			graphic = new Image(new BitmapData(width, height, false, 0xFF552200));
		}
		
		override public function update():void
		{
			x = FP.camera.x - FP.width*3;
		}
	}
}
