package
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Graphiclist;

	public class Backdrop extends Entity
	{
		private var _darkList:Graphiclist = new Graphiclist();
		private var _lightList:Graphiclist = new Graphiclist();
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
			var scrollX:Number = 0.1;
			var scrollY:Number = 0;

			hillNear.x = hillNearDark.x = gX;
			hillNear.y = hillNearDark.y = gY;
			hillNear.scrollX = hillNearDark.scrollX = scrollX;
			hillNear.scrollY = hillNearDark.scrollY = scrollY;

			gX = 0;
			gY = FP.height - hillFar.height;
			scrollX = 0.02;

			hillFar.x = hillFarDark.x = gX;
			hillFar.y = hillFarDark.y = gY;
			hillFar.scrollX = hillFarDark.scrollX = scrollX;
			hillFar.scrollY = hillFarDark.scrollY = scrollY;

			gX = 0;
			gY = 0;
			scrollX = 0;

			background.x = backgroundDark.x = gX;
			background.y = backgroundDark.y = gY;
			background.scrollX = backgroundDark.scrollX = scrollX;
			background.scrollY = backgroundDark.scrollY = scrollY;
			_lightList.add(background);
			_darkList.add(backgroundDark);
			_lightList.add(hillFar);
			_darkList.add(hillFarDark);
			_lightList.add(hillNear);
			_darkList.add(hillNearDark);

			graphic = _lightList;
		}

		override public function update():void
		{
			if(_switching = true)
			{
				//Do stuff
			}
		}

		public function SwitchGraphics():void
		{
			if(graphic == _lightList)
			{
				
				graphic = _darkList;
			}
			else
			{
				graphic = _lightList;
			}
		}


	}
}
