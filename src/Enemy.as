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

			/*width = 20;
			height = 20;
			graphic = new Image(new BitmapData(width,height,false,0xFF7766FF));
			_vel.x = -1.0;*/

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
			var ent:Entity = collide(A.typPLAYERATTACK1, 0, 0);
			var damaged:Boolean = false;
			
			if(ent && !HasAlreadyHit(ent))
			{
				damaged = true;
				--_life;
				_hasHit.push(ent); //Prevent one damage event from counting twice
			}
			ent = collide(A.typPLAYERATTACK2,0,0);
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



		protected function GetDirectionToPlayer():int
		{
			return FP.sign(Game.player.x - x);
		}
			
	}
}
