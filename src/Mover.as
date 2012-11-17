package
{
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;

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

		override public function update():void
		{
			_vel.add(_acc);
			x += _vel.x;
			y += _vel.y;
		}

		public function set vel(vel:Point):void { _vel = vel; }
		public function set acc(acc:Point):void { _acc = acc; }
		public function get vel():Point { return _vel; }
		public function get acc():Point { return _acc; }
	}
}
