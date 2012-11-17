package
{
	import flash.display.BitmapData;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;

	public class Enemy extends Mover
	{
		public function Enemy(x:int, y:int)
		{
			super(x,y);
			width = 20;
			height = 20;
			type = A.typENEMY;
			var g:Graphic = new Image(new BitmapData(width,height,false,0xFF0000FF));
			_vel.x = -0.6;
		}

		override public function update():void
		{
			_vel.add(_acc);
			x += _vel.x;
			y += _vel.y;
		}
			
	}
}
