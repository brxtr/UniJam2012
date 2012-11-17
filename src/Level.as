package
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;

	public class Level extends Entity
	{
		public function Level()
		{
			height = 30;
			width = FP.width;
			x = 0;
			y = FP.height - height;
			type = "solid"; //Change this to typSOLID;
		}
		
		override public function update():void
		{
			x = FP.camera.x;
		}
	}
}
