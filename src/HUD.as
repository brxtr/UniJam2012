package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Text;
	
	public class HUD extends Entity 
	{
		private var score:Text = new Text("", FP.width - 8, 8, { size: 24, align: "right" } );
		
		public function HUD() 
		{
			layer = -100;
			score.scrollX = 0;
		}
		
		override public function update():void
		{
			score = String(Game.score);
			score.align = "right";
		}
		
	}

}