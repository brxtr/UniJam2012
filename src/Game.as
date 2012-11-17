package  
{
	import flash.display.BitmapData;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	
	public class Game extends World 
	{
		private var floor:Entity;
		
		public static var safe:Boolean; // temporary code to keep flashdevelop happy
		
		public function Game() 
		{
			floor = addGraphic(new Image(new BitmapData(FP.screen.width, 64, false, 0)), 0, 0, FP.height - 64);
			
			add(new Player(FP.width / 2, FP.height - 160));
		}
		
		override public function update():void
		{
			super.update();
			
			floor.x = FP.camera.x;
		}
		
	}

}