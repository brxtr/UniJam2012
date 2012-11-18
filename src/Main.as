package  
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	
	public class Main extends Engine
	{
		
		public function Main()
		{
			super(800, 600);
		}
		
		override public function init():void 
		{
			FP.world = new Title;
			FP.screen.color = 0x3A3323;
			//FP.console.enable();
		}
		
	}
	
}
