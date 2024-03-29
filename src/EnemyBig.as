package  
{
	import flash.display.BitmapData;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	public class EnemyBig extends Enemy 
	{
		static private var a:Image = new Image(A.gfxBIG);
		private var _canAttack:Boolean;
		
		public function EnemyBig(x:int, y:int)
		{
			super(x, y);
			
			_canAttack = true;
			_points = 500;
			graphic = a;
			_life = 5;
			type = A.typENEMYATTACK2;
			
			setHitbox(a.width, a.height);
		}
		
		override public function update():void
		{
			if (_life <= 0)
			{
				FP.world.remove(this);
			}
			
			_vel.x = GetDirectionToPlayer() * 2;
			
			_vel.y += _acc.y;
			
			Move();
			
			CheckDamage();		

			if(_life < 0)
			{
				Game.score += _points;
				FP.world.remove(this);
			}
		} 
	} 
}
