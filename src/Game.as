package
{
	import flash.display.BitmapData;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.World;
	import net.flashpunk.Sfx;
	import net.flashpunk.FP;
	import net.flashpunk.tweens.misc.Alarm
	
	public class Game extends World 
	{
		public static const gravity:Number = 0.4;
		public static const friction:Number = 2;

		private static var _firstGame:Boolean = true;

		public static var score:int;
		public static function get player():Player { return _player; }
		private static var _safe:Boolean;
		public static function get safe():Boolean { return _safe; }

		private static var _tutText:Text;

		private static var _player:Player;

		private const _soft1:Sfx = new Sfx(A.sndSOFT1, SwitchMode);
		private const _soft2:Sfx = new Sfx(A.sndSOFT2, SwitchMode);
		private const _hard1:Sfx = new Sfx(A.sndHARD1, SwitchMode);
		private const _hard2:Sfx = new Sfx(A.sndHARD2, Win);

		private const _musArray:Array = [_soft1, _hard1,_soft2,_hard2];
		private var _currentSong:int = 0;

		private var floor:Entity;
		private var _level:Level;
		private var _backdrop:Background;
		private var _enemies:Array;
		private var _toRemove:Array;
		

		public function Game() 
		{
			_safe = true;

			_enemies = [];
			_toRemove = [];

			_musArray[_currentSong].play();
			//SwitchMode();
			
			_player = new Player(FP.width / 2,FP.height / 2);
			_level = new Level();

			_backdrop = new Background();
			add(_backdrop);
			add(_level);
			add(_player);

			if(_firstGame)
			{
				_firstGame = false;
				_tutText = new Text("WASD + Shift");
				_tutText.x = (FP.width - _tutText.width) / 2;
				_tutText.y = (FP.height - _tutText.height) / 2;
			}
		}
		
		override public function update():void
		{
			//Enemy stuff
			FP.remove(_enemies,undefined)
			for(var index:String in _enemies)
			{
				if(_enemies[index].x + _enemies[index].width < FP.camera.x)
				{
					_toRemove.push(_enemies[index]);
				}
			}
			
			while (_toRemove.length != 0)
			{
				var ent:Entity = _toRemove.pop();
				remove(ent);
				ent = undefined;
			}
			//end enemy stuff
			
			super.update();
			TrackCam();
		}

		private function SwitchMode():void
		{
			_backdrop.SwitchGraphics();
			PlayNextSong();
			if(_safe)
			{
				_safe = false;
				//Spawn enemies and stuff

				SpawnEnemy();
			}
			else
			{
				_safe = true;
			} 
		}

		private function PlayNextSong():void
		{
			if(_currentSong < 3)
			{
				_musArray[++_currentSong].play();
			}
		}

		private function SpawnEnemy():void
		{
			var enemy:Enemy = new EnemyMob(FP.camera.x + FP.width, FP.height/2);
			_enemies.push(enemy);
			add(enemy);

			//Spawn next enemy
			if(!_safe)
			{
				var time:Number = Math.random()*2 + 1;
				FP.alarm(time, SpawnEnemy);
			}
		}

		private function Win():void
		{
		}

		private function TrackCam():void
		{
			FP.camera.x = _player.x - 50;
			//FP.camera.y = _player.y;
		}
	} 
}
