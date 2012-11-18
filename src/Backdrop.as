package
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Graphiclist;

	public class Backdrop extends Entity
	{
		private var _otherList:Graphiclist;
		private var _currentList:Graphiclist;
		private var _both:Graphiclist;

		private var hillNear:Image = new Image(A.gfxHILLNEAR);
		private var hillNearDark:Image = new Image(A.gfxHILLNEARDARK);
		private var hillFar:Image = new Image(A.gfxHILLFAR);
		private var hillFarDark:Image = new Image(A.gfxHILLFARDARK);
		private var background:Image = new Image(A.gfxLIGHTBACKGROUND);
		private var backgroundDark:Image = new Image(A.gfxDARKBACKGROUND);

		private var _switching:Boolean;

		public function Backdrop()
		{
			var gX:int = 0;
			var gY:int = FP.height - hillNear.height;
			var scrollX:Number = 0.2;
			var scrollY:Number = 0;


			hillNear.x = hillNearDark.x = gX;
			hillNear.y = hillNearDark.y = gY;
			hillNear.scrollX = hillNearDark.scrollX = scrollX;
			hillNear.scrollY = hillNearDark.scrollY = scrollY;
			_currentList.add(hillNear);
			_otherList.add(hillNearDark);

			gX = 0;
			gY = FP.height - hillFar.height;
			scrollX = 0.01;

			hillFar.x = hillFarDark.x = gX;
			hillFar.y = hillFarDark.y = gY;
			hillFar.scrollX = hillFarDark.scrollX = scrollX;
			hillFar.scrollY = hillFarDark.scrollY = scrollY;
			_currentList.add(hillFar);
			_otherList.add(hillFarDark);

			gX = 0;
			gY = 0;
			scrollX = 0;

			background.x = backgroundDark.x = gX;
			background.y = backgroundDark.y = gY;
			background.scrollX = backgroundDark.scrollX = scrollX;
			background.scrollY = backgroundDark.scrollY = scrollY;
			_currentList.add(background);
			_otherList.add(backgroundDark);

			graphic = _currentList;
		}

		override public function update():void
		{
			if(_switching = true)
			{
				//Do stuff
			}
		}


	}
}
