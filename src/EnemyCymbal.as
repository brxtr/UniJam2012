package  
{
	import flash.display.BitmapData;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Spritemap;
	
	public class EnemyCymbal extends Enemy 
	{
		private var sprCymbal:Spritemap = new Spritemap(A.gfxCYMBAL,62,95);
		
		public function EnemyCymbal(x:int, y:int) 
		{
			super(x, y);
			
			_life = 2;
			_points = 150;

			type = A.typENEMYATTACK1;
			
			sprCymbal.add("move",[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14],16);
			sprCymbal.play("move");
			graphic = sprCymbal;

			setHitbox(sprCymbal.width, sprCymbal.height);
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

			if(_life < 0)
			{
				Game.score += _points;
				FP.world.remove(this);
			}
		}

		/*override protected function CheckDamage():Boolean
		{ 
			if(Game.player.y + Game.player.height - 10 < y)
			{
				return super.CheckDamage();
			}

			return false;
		}	*/	
	} 
}
