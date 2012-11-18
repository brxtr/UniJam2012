package  
{
	import flash.display.BitmapData;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	public class EnemyCymbal extends Enemy 
	{
		private var a:Image = new Image(new BitmapData(64, 48, false, 0xFFFFFF));
		
		public function EnemyCymbal(x:int, y:int) 
		{
			super(x, y);
			
			graphic = a;
			
			setHitbox(a.width, a.height);
		}
		
		override public function update():void
		{
			//super.update();
			
			_vel.x = GetDirectionToPlayer() * 4;
			
			_vel.y += _acc.y;
			
			Move();
		
			if (collide(A.typPLAYER, x, y) && Game.player.y + Game.player.height - 10 < y)
			{
				FP.world.remove(this);
				FP.console.log("It happened");
			}
		}
		
	}

}