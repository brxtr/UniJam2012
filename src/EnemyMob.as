package  
{
	import flash.display.BitmapData;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Spritemap;
	
	public class EnemyMob extends Enemy 
	{
		private var sprImp:Spritemap = new Spritemap(A.gfxIMP,78,81);

		
		public function EnemyMob(x:int, y:int)
		{
			super(x, y);
			
			type = A.typENEMYATTACK1;
			sprImp.add("move",[0,1,2,3],12);
			graphic = sprImp;
			sprImp.play("move");
			_life = 1;
			
			setHitbox(sprImp.width, sprImp.height);
		}
		
		override public function update():void
		{
			//super.update();
			
			_vel.x = -6//GetDirectionToPlayer() * 6; 
			_vel.y += _acc.y;
			
			/*if(GetDirectionToPlayer() > 0)
			{
				sprImp.flipped = true;
			}*/
			Move();

			CheckDamage();
		
			if (_life <= 0)
			{
				FP.world.remove(this);
			}
		}
		
	}

}
