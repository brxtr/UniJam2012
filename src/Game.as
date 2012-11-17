package
{
	import flash.display.BitmapData;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.World;
	import net.flashpunk.Sfx;
	import net.flashpunk.FP;
	
	public class Game extends World 
	{
		private var floor:Entity;
		//private var _camera:Camera;
		private const _soft:Sfx = new Sfx(A.sndSOFT, SwitchMode);
		private const _hard:Sfx = new Sfx(A.sndHARD, SwitchMode);
		private static var _safe:Boolean;
		
		public static function get safe():Boolean { return _safe; }

		public function Game() 
		{
			floor = addGraphic(new Image(new BitmapData(FP.screen.width, 64, false, 0)), 0, 0, FP.height - 64);
			floor.type = A.typSOLID;
			//_camera = new Camera(this);
			_safe = true;

			_soft.play();
			
			add(new Player(FP.width / 2, FP.height - 160));
		}
		
		override public function update():void
		{
			super.update();
			
			floor.x = FP.camera.x;

			var txt:String;
			txt = (_safe ? "Safe" : "Uhoh");
			FP.console.log(txt);

			//_camera.Update();
		}

		private function SwitchMode():void
		{
			if(_safe)
			{
				_safe = false;
				_hard.play();
			}
			else
			{
				//Spawn enemies and stuff
				_safe = true;
				_soft.play();
			}
		}
	} 
}
