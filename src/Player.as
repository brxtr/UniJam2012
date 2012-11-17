package  
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;

	public class Player extends Mover 
	{
		private var spr:Image = new Image(new BitmapData(64, 96, false, 0));
		
		private var jump:Number = -5;
		private var fric:Number = 2;
		private var maxWalk:Number = 4, maxRun:Number = 8; // max walking and running
		
		public function Player(x:int, y:int)
		{
			this.x = x;
			this.y = y;
			
			vel = new Point(0, 0);
			acc = new Point(0.1, 10);
			
			// TODO: change to spritemap and add animations
			
			graphic = spr;
			
			setHitbox(spr.width, spr.height);
			type = A.typPLAYER;
			
			Input.define("jump", Key.UP, Key.W);
			Input.define("left", Key.LEFT, Key.A);
			Input.define("right", Key.RIGHT, Key.D);
		}
		
		override public function update():void
		{
			if (Input.check("left"))
			{
				vel.x -= acc.x;
			}
			if (Input.check("right"))
			{
				vel.x += acc.x;
			}
			
			if (Input.check("jump") && collide(A.typSOLID, x, y + 1)) vel.y = jump;
			if (!Input.check("jump") && vel.y < 0) vel.y += acc.y;
			vel.y += acc.y;
			
			for (var i:int = 0; i < Math.abs(vel.x); i ++)
			{
				if (!collide(A.typSOLID, x + FP.sign(vel.x), y))
				{
					x += FP.sign(vel.x);
				}
				else
				{
					vel.x = 0;
				}
			}
			
			for (i = 0; i < Math.abs(vel.y); i ++)
			{
				if (!collide(A.typSOLID, x, y + FP.sign(vel.y)))
				{
					y += vel.y;
				}
				else
				{
					vel.y = 0;
				}
			}
			
			if (!Input.check("left") && !Input.check("right"))
			{
				if (vel.x > 0)
				{
					vel.x -= fric;
					if (vel.x < 0) vel.x = 0;
				}
				if (vel.x < 0)
				{
					vel.x += fric;
					if (vel.x > 0) vel.x = 0;
				}
			}
			
			if (Game.safe)
			{
				if (Math.abs(vel.x) > maxWalk) vel.x = FP.sign(vel.x) * maxWalk;
			}
			else 
			{
				if (Math.abs(vel.x) > maxRun) vel.x = FP.sign(vel.x) * maxRun;
			}
		}
		
	}

}