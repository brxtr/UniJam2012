package
{
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.FP;

	public class Mover extends Entity
	{
		protected var _vel:Point;
		protected var _acc:Point;

		public function Mover(x:int = 0, y:int = 0, graphic:Graphic = null, mask:Mask = null)
		{
			super(x,y,graphic,mask);
			_vel = new Point(0,0);
			_acc = new Point(0,0);
		}

		protected function Move():void
		{
			for (var i:int = 0; i < Math.abs(_vel.x); i ++)
			{
				if (!collide(A.typSOLID, x + FP.sign(_vel.x), y))
				{
					x += FP.sign(_vel.x);
				}
				else
				{
					vel.x = 0;
				}
			}
			
			for (i = 0; i < Math.abs(_vel.y); i ++)
			{
				if (!collide(A.typSOLID, x, y + FP.sign(_vel.y)))
				{
					y += FP.sign(_vel.y);
				}
				else
				{
					vel.y = 0;
				}
			}
		}


		public function set vel(vel:Point):void { _vel = vel; }
		public function set acc(acc:Point):void { _acc = acc; }
		public function get vel():Point { return _vel; }
		public function get acc():Point { return _acc; }
	}
}
