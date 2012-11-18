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
		public static const gravity:Number = 0.4;

		public static function get player():Player { return _player; }
		private static var _safe:Boolean;
		public static function get safe():Boolean { return _safe; }

		private const _soft:Sfx = new Sfx(A.sndSOFT, SwitchMode);
		private const _hard:Sfx = new Sfx(A.sndHARD, SwitchMode);

		private var floor:Entity;
		private static var _player:Player;
		private var _level:Level;
		private var _enemies:Array;
		private var _toRemove:Array;
		

		public function Game() 
		{
			_safe = true;

			_enemies = [];
			_toRemove = [];

			//_soft.play();
			SwitchMode();
			
			_player = new Player(FP.width / 2,FP.height / 2);
			_level = new Level();

			add(_player);
			add(_level);
		}
		
		override public function update():void
		{
			//Enemy stuff
<<<<<<< HEAD
			FP.remove(_enemies, undefined)
			for(var index:String in _enemies)
=======
			/*for(var index:String in _enemies)
>>>>>>> 2f9dd6fb8936df5414d7d03dd38f588745d535a5
			{
				if(_enemies[index].x + _enemies[index].width < FP.camera.x)
				{
					_toRemove.push(_enemies[index]);
				}
			}
<<<<<<< HEAD
=======
			FP.remove(_enemies,undefined)*/
>>>>>>> 2f9dd6fb8936df5414d7d03dd38f588745d535a5
			//end enemy stuff
			
			while (_toRemove.length != 0)
			{
				var ent:Entity = _toRemove.pop();
				remove(ent);
				ent = undefined;
			}
			super.update();
			TrackCam();
		}


		private function SwitchMode():void
		{
			if(_safe)
			{
				_safe = false;
				_hard.play();
				//Spawn enemies and stuff

				SpawnEnemy();
			}
			else
			{
				_safe = true;
				_soft.play();
			}
		}

		private function SpawnEnemy():void
		{
<<<<<<< HEAD
			var enemy:EnemyCymbal = new EnemyCymbal(FP.camera.x + FP.width, FP.height/2);
=======
		/*	var enemy:Enemy = new Enemy(FP.camera.x + FP.width, FP.height/2);
>>>>>>> 2f9dd6fb8936df5414d7d03dd38f588745d535a5
			_enemies.push(enemy);
			add(enemy);

			//Spawn next enemy
			var time:Number = Math.random()*2 + 1;
<<<<<<< HEAD
			FP.alarm(time, SpawnEnemy);
=======
			FP.alarm(time,SpawnEnemy);*/
>>>>>>> 2f9dd6fb8936df5414d7d03dd38f588745d535a5
		}

		private function TrackCam():void
		{
			FP.camera.x = _player.x;
			//FP.camera.y = _player.y;
		}
	} 
}
