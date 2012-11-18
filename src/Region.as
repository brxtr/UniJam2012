package
{
	import flash.display.BitmapData
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;

	public class Region extends Entity
	{
		public function Region(x:int,y:int,w:int,h:int,type:String)
		{
			if(w <= 0) w = 1;
			if(h <= 0) h = 1;

			super(x,y);
			setHitbox(w,h);
			graphic = new Image(new BitmapData(width,height,true,0x55FF7766));
			this.type = type;
		}
	}
}
