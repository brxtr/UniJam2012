package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	public class HUD extends Entity 
	{
		private var score:Text = new Text("", FP.width - 14, 14, { size: 44, align: "right", color: 0 } );
		private var go:Text = new Text("GAME OVER - PRESS SPACE", 0, 0, { size: 80, color: 0 } );
		
		private var g:Graphiclist = new Graphiclist(score, go);
		
		public function HUD() 
		{
			go.visible = false;
			graphic = g;
			
			layer = -100;
			score.scrollX = go.scrollX = 0;
		}
		
		override public function update():void
		{
			score.text = String(Game.score);
			//score.align = "right";

			score.x = FP.screen.width - score.width - 14;
			
			if (Player.player.life <= 0)
			{
				go.visible = true;
				go.x = (FP.screen.width - go.width) / 2;
				go.y = (FP.screen.height - go.height) / 2;
				if (Input.pressed(Key.SPACE)) FP.world = new Game;
			}
		}
		
	}

}
