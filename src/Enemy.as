package
{
	import flash.display.BitmapData;
	import net.flashpunk.Graphic;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;

	public class Enemy extends Mover
	{
		protected var _life:int;
		protected var _hasHit:Array;

		public function Enemy(x:int, y:int)
		{
			super(x,y);

			type = A.typENEMY;
			_hasHit = [];
			_life = 0;
			_acc.y = Game.gravity;
		}

		override public function update():void
		{
			//Adjust speed
			_vel.x += _acc.x;
			_vel.y += _acc.y;

			Move();
		} 

		protected function CheckDamage():Boolean
		{
			var ent:Entity = collide(A.typPLAYERATTACK1, x, y);
			var damaged:Boolean = false;
			
			if(ent && !HasAlreadyHit(ent))
			{
				damaged = true;
				--_life;
				_hasHit.push(ent); //Prevent one damage event from counting twice
			}
			ent = collide(A.typPLAYERATTACK2,x,y);
			if(ent && !HasAlreadyHit(ent))
			{
				damaged = true;
				_life -= 2;
				_hasHit.push(ent); //Prevent one damage event from counting twice
			}
			
			return damaged;
		}

		protected function HasAlreadyHit(ent:Entity):Boolean
		{
			for(var i:String in _hasHit)
			{
				if(_hasHit[i] == ent)
				{
					return true;
				}
			}
			return false;
		} 

		protected function GetDistanceToPlayer():int
		{
			return Game.player.x - x;
		}
			
		protected function GetDirectionToPlayer():int
		{
			return FP.sign(GetDistanceToPlayer());
		}
			
	}
}
