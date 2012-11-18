package
{
	import net.flashpunk.FP;

	public class Dagger extends Mover
	{
		public function Dagger(x:int,y:int)
		{
			super(x,y);

			_acc.x = 0;
			_acc.y = Game.gravity;
			type = A.typENEMYATTACK2;

			FP.alarm(3,RemoveThis);
		}

		override public function update():void
		{
			_vel.y += _acc.y;
			Move();
		}

		private function RemoveThis():void
		{
			FP.world.remove(this);
		}
	}
}
