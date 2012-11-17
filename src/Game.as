package
{
	import net.flashpunk.World;
	import net.flashpunk.Sfx;
	import net.flashpunk.FP;
	
	public class Game extends World 
	{
		private var _camera:Camera;
		private const _soft:Sfx = new Sfx(A.sndSOFT, SwitchMode);
		private const _hard:Sfx = new Sfx(A.sndHARD, SwitchMode);
		private var _safe:Boolean;

		public function get safe():Boolean { return _safe; }

		public function Game() 
		{
			_camera = new Camera(this);
			_safe = true;

			_soft.play();
		}

		override public function update():void
		{
			super.update();

			var txt:String;
			txt = (_safe ? "Safe" : "Uhoh");
			FP.console.log(txt);

			_camera.Update();
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
