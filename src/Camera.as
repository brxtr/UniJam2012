package
{
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.World;
	import net.flashpunk.FP;

	public class Camera extends Mover
	{
		private var _subject:Entity;
		private var _stopped:Boolean;
		private var _pos:Point;
		private var _offset:Point;
		private var _world:World;
		private const _speed:Number = 0.5;

		public function get stopped():Boolean { return _stopped; }
		public function set stopped(stopped:Boolean):void { _stopped = stopped; }
		public function get offset():Point { return _offset; }
		public function set offset(p:Point):void { _offset = p; }
		public function get subject():Entity { return _subject}
		public function set subject(subject:Entity):void { _subject = subject; }

		public function Tracking():Boolean
		{
			return _stopped && _subject;
		}

		public function Camera(world:World, x:int = 0,y:int = 0)
		{
			_stopped = false;
			_subject = undefined;
			_world = world;

			super(x,y);
		}

		public function Update():void
		{
			//Track subject here
			if(!_stopped && _subject)
			{
				var displacement:Point = new Point(_subject.x,_subject.y);
				displacement.subtract(_pos);
				displacement.subtract(_offset);

				if(displacement.x != 0 && displacement.y != 0)
				{
					var dir:Point = displacement.normalize(1);

					_pos.x += dir.x*_speed;
					_pos.y += dir.y*_speed;
				}
				else if(displacement.y == 0)
				{
					_pos.x += _speed;
				}
				else if(displacement.x == 0)
				{
					_pos.y += _speed;
				}
			}

			_world.camera.copyFrom(_pos);
		}

		public function Track(ent:Entity,offset:Point = new Point(0,0)):void
		{
			_subject = ent;
			_offset = offset;
		} 
	}
}
