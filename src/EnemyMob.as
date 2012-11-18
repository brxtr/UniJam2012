package  
{
	import flash.display.BitmapData;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	public class EnemyMob extends Enemy 
	{
		private var a:Image = new Image(new BitmapData(48, 32, false, 0xCCCCCC));
		
		public function EnemyMob(x:int, y:int)
		{
			super(x, y);
			
			graphic = a;
			
			setHitbox(a.width, a.height);
		}
		
		override public function update():void
		{
			//super.update();
			
			_vel.x = GetDirectionToPlayer() * 6;
			
			_vel.y += _acc.y;
			
			Move();
		
			if (collide(A.typPLAYER, x, y))
			{
				FP.world.remove(this);
			}
		}
		
	}

}