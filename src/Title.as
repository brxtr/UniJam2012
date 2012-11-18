package  
{
	import net.flashpunk.graphics.Text;
	import net.flashpunk.World;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input;
	
	public class Title extends World 
	{
		private var text:Entity;
		private var text2:Entity;
		
		private var ttext:Text = new Text("Run to the Right #5:", 64, 32, { size: 96 } );
		private var ttext2:Text = new Text("Genesis of Evil", 64, 132, { size: 96 } );
		
		private var e:Entity;
		private var s:Spritemap = new Spritemap(A.gfxPLAYERSTILL, 58, 96);
		
		private var play:Entity;
		private var playText:Text = new Text("Play", 0, 0, { size: 64 } );
		private var cred:Entity;
		private var credText:Text = new Text("by\nJamie Bayne\nJack Brockley\nBen Wells", 570, 340, { size: 32, align: "right", height: 400 } );
		
		public function Title() 
		{
			play = addGraphic(playText);
			play.type = "p";
			play.setHitbox(playText.width, playText.height);
			play.x = 65;
			play.y = 400;
			
			text = addGraphic(ttext);
			text2 = addGraphic(ttext2);
			
			ttext.x = (FP.width - ttext.width) / 2;
			ttext2.x = (FP.width - ttext2.width) / 2;
			
			e = addGraphic(s);
			s.scale = 6;
			s.x = ((FP.width - s.scaledWidth) / 2) - 100;
			s.y = 300;
			
			cred = addGraphic(credText);
		}
		
		override public function update():void
		{
			if (collidePoint("p", mouseX, mouseY))
			{
				Input.mouseCursor = "button";
				playText.color = 0xD97D3C;
				if (Input.mousePressed)
				{
					FP.world = new Game;
				}
			}
			else
			{
				Input.mouseCursor = "auto";
				playText.color = 0xFFFFFF;
			}
		}
		
	}

}