package
{
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import flash.geom.Point;

	public class Mover extends Entity
	{
		private var _vel:Point;
		private var _acc:Point;

		public function Mover(x:int = 0, y:int = 0, graphic:Graphic = null, mask:Mask = null)
		{
			super(x,y,graphic,mask);
		}

		public function set vel(vel:Point):void { _vel = vel; }
		public function set acc(acc:Point):void { _acc = acc; }
		public function get vel():Point { return _vel; }
		public function get acc():Point { return _acc; }
	}
}