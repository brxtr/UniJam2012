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
		
		private var mw:Number = 1, mr:Number = 2; // max walking and running
		
		private var jump:Number = -5;
		
		public function Player(x:int, y:int)
		{
			this.x = x;
			this.y = y;
			
			vel = new Point(0, 0);
			acc = new Point(0.1, 0);
			
			graphic = spr;
			
			setHitbox(spr.width, spr.height);
			type = A.typPLAYER;
			
			Input.define("jump", Key.UP, Key.W);
			Input.define("left", Key.LEFT, Key.A);
			Input.define("right", Key.RIGHT, Key.D);
		}
		
		override public function update():void
		{
			if (Input.check("right") && vel.x < (Game.safe ? mw : mr) - acc.x) vel.x += acc.x;
			if (Input.check("left") && vel.x < (Game.safe ? mw : mr) + acc.x) vel.x -= acc.x;
			vel.y += acc.y;
			
			for (var i:int = 0; i < Math.abs(vel.x); i ++)
			{
				x += FP.sign(vel.x);
			}
			
			//x += vel.x;
			y += vel.y;
		}
		
	}

}