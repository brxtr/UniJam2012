package
{
	import flash.display.BitmapData;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;

	public class Enemy extends Mover
	{
		public function Enemy(x:int, y:int)
		{
			width = 20;
			height = 20;
			type = "enemy" // Move to A.typENEMY;
			var g:Graphic = new Image(new BitmapData(width,height,false,0xFF0000FF));
			super(x,y);
			_vel.x = -0.6;
		}
	}
}
