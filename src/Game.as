package
{
	import flash.display.BitmapData;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.World;
	import net.flashpunk.Sfx;
	import net.flashpunk.FP;
	import net.flashpunk.tweens.misc.Alarm
	
	public class Game extends World 
	{
		private var _player:Player;
		private var _enemies:Array;
		private const _soft:Sfx = new Sfx(A.sndSOFT, SwitchMode);
		private const _hard:Sfx = new Sfx(A.sndHARD, SwitchMode);
		static private var _safe:Boolean;
		
		static public function get safe():Boolean { return _safe; }

		public function Game() 
		{
			_safe = true;

			_enemies = [];

			_soft.play();
			
			_player = new Player(FP.width / 2,FP.height / 2);

			add(_player);
			add(new Level());
		}
		
		override public function update():void
		{
			//Enemy stuff
			for(var index:String in _enemies)
			{
				if(_enemies[index].x + _enemies[index].width < FP.camera.x)
				{
					remove(_enemies[index]); 
					_enemies[index] = undefined;
				}
			}
			FP.remove(_enemies,undefined)
			//end enemy stuff

			TrackCam();
			super.update();
		}

		private function SwitchMode():void
		{
			if(_safe)
			{
				_safe = false;
				_hard.play();
				//Spawn enemies and stuff

				var time:Number = Math.random()*2 + 1;

				FP.alarm(time,SpawnEnemy);
			}
			else
			{
				_safe = true;
				_soft.play();
			}
		}

		private function SpawnEnemy():void
		{
			var enemy:Enemy = new Enemy(FP.width,FP.height/2);
			_enemies.push(enemy);
			add(enemy);
		}

		private function TrackCam():void
		{
			FP.camera.x = _player.x;
			//FP.camera.y = _player.y;
		}
	} 
}
