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
			_life = 1;
			
			setHitbox(a.width, a.height);
		}
		
		override public function update():void
		{
			//super.update();
			
			_vel.x = GetDirectionToPlayer() * 6; 
			_vel.y += _acc.y;
			
			Move();

			CheckDamage();
		
			if (_life <= 0)
			{
				FP.world.remove(this);
			}
		}
		
	}

}
