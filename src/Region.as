package
{
	import flash.display.BitmapData
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;

	public class Region extends Entity
	{
		public function Region(x:int,y:int,w:int,h:int,type:String)
		{
			super(x,y);
			setHitbox(w,h);
			graphic = new Image(new BitmapData(width,height,false,0xFF7766FF));
			this.type = type;
		}
	}
}
