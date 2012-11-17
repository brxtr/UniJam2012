package
{
	import flash.display.BitmapData;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;

	public class Enemy extends Mover
	{
		public function Enemy(x:int, y:int)
		{
			super(x,y);
			width = 20;
			height = 20;
			type = A.typENEMY;
			graphic = new Image(new BitmapData(width,height,false,0xFF7766FF));
			_vel.x = -1.0;
			_acc.y = Game.gravity;
		}

		override public function update():void
		{
			//Adjust speed
			_vel.x += _acc.x;
			_vel.y += _acc.y;

			move();
		}
			
	}
}
