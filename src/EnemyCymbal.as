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
			
			_life = 2;
			graphic = a;
			
			setHitbox(a.width, a.height);
		}
		
		override public function update():void
		{
			if(_life <= 0)
			{
				FP.world.remove(this);
			}

			_vel.x = GetDirectionToPlayer() * 4;
			
			_vel.y += _acc.y;
			
			Move();
		}

		override protected function CheckDamage():Boolean
		{ 
			if(Game.player.y + Game.player.height - 10 < y)
			{
				return super.CheckDamage();
			}

			return false;
		}		
	} 
}
