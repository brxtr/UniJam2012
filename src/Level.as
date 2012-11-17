package
{
	import flash.display.BitmapData
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
			type = "solid"; //Change this to typSOLID;

			graphic = new Image(new BitmapData(width,height,false,0x887766FF));
		}
		
		override public function update():void
		{
			x = FP.camera.x;
			FP.console.log(x - FP.camera.x);
		}
	}
}
