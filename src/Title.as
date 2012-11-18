package  
{
	import net.flashpunk.graphics.Text;
	import net.flashpunk.World;
	import net.flashpunk.Entity;
	
	public class Title extends World 
	{
		private var text:Entity;
		
		public function Title() 
		{
			text = addGraphic(new Text("Run to the Right #5: Explosions of Genesis", 64, 64, { font: 'fntHIGHLA2', color: 0xFFFFFF } ));
		}
		
	}

}