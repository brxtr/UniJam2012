package  
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	import net.flashpunk.FP;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.graphics.Image;

	public class Player extends Mover 
	{
		private var _life:int;
		
		private var sprJump:Image = new Image(A.gfxPLAYERJUMP);
		private var sprRun:Spritemap = new Spritemap(A.gfxPLAYERRUN, 74, 107);
		private var sprIdle:Spritemap = new Spritemap(A.gfxPLAYERIDLE, 78, 96);
		private var sprAttack1:Spritemap = new Spritemap(A.gfxPLAYERATTACK1, 156, 103);
		private var sprStrum:Spritemap = new Spritemap(A.gfxPLAYERSTRUM, 85, 96);
		
		private var _damageRegion:Region;
		private var _attacking:Boolean;
		private var _attackType:int;
		private var _hasHit:Array;

		private var _xDir:int;
		private var _jumping:Boolean;
		private var jump:Number = -12;
		private var maxWalk:Number = 4, maxRun:Number = 8; // max walking and running

		//0 - no attack
		//1 - melee standing
		//2 - ranged standing
		//3 - melee jumping
		//ranged jumping is pick-throw

		public function Player(x:int, y:int)
		{
			this.x = x;
			this.y = y;
			
			_vel = new Point(0, 0);
			_acc = new Point(0.5, Game.gravity);
			_xDir = 1;
			_life = 5;

			_hasHit = [];
			_attacking = false;
			_jumping = false;
			_attackType = 0;
			
			sprRun.add("run", [0, 1, 2, 3], 12);
			sprIdle.add("idle", [0, 1], 3);
			sprAttack1.add("attack1", [0, 1, 2, 3, 4, 5, 6, 7], 30,false);
			sprStrum.add("strum", [0, 1], 12);
			
			// initial graphic
			graphic = sprIdle;
			sprIdle.play("idle");
			
			originX = 10;
			setHitbox(68, 96);
			type = A.typPLAYER;
			
			Input.define("jump", Key.UP, Key.W);
			Input.define("left", Key.LEFT, Key.A);
			Input.define("right", Key.RIGHT, Key.D);
			Input.define("melee", Key.SHIFT, Key.X);
			Input.define("ranged", Key.CONTROL, Key.C);
		}
		
		override public function update():void
		{
			if(!_attacking)
			{
				if (Input.check("left"))
				{
					graphic = sprRun;
					sprRun.play("run");
					sprRun.flipped = true;
					_vel.x -= _acc.x;
					_xDir = -1;
				}
				if (Input.check("right"))
				{
					graphic = sprRun;
					sprRun.play("run");
					sprRun.flipped = false;
					_vel.x += _acc.x;
					_xDir = 1;
				}
			}
			
			if(collide(A.typSOLID, x, y + 1))
			{
				if(_jumping)
				{
					_jumping = false;
					graphic = sprIdle;
					sprIdle.play("idle");
				}
				if (Input.pressed("jump"))
				{
					Jump();
					graphic = sprJump;
				}
			}

			if(vel.y < 0)
			{
				vel.y += acc.y;
			}

			vel.y += acc.y; //Double?
			
			Move();

			if(!Input.check("left") && !Input.check("right"))
			{
				if (Math.abs(_vel.x) > 0)
				{
					graphic = (Game.safe) ? sprStrum : sprIdle;
					sprIdle.play("idle");
					sprStrum.play("strum");
					sprIdle.flipped = sprStrum.flipped = ( _xDir < 0);
					_vel.x -= FP.sign(_vel.x)*Game.friction;
				}
				else
				{
					_vel.x = 0;
				}
			}

			HandleAttacks();

			ClampVel();

			if(CheckDamage())
			{
				//Some sort of damage animation/flashing here
			}
		}

		/*Attacking code start */

		private function HandleAttacks():void
		{
			if(_attacking)
			{
				switch(_attackType)
				{
				case 1:
					/*if(_xDir > 0)
					{
						_damageRegion.x = x + width;
						sprAttack1.flipped = false;
					}
					else
					{
						_damageRegion.x = x + _damageRegion.width;
						sprAttack1.flipped = true;
					}*/
					_vel.x = 0; _vel.y = 0;
					break;
				case 2:
					break;
				case 3:
					break;
				default:
					break;
				}
			}

			if(Input.pressed("melee"))
			{
				MeleeAttack();
			}
			else if(Input.pressed("ranged"))
			{
				RangedAttack();
			}
		}
			
		private function MeleeAttack():void
		{
			if(!_attacking)
			{
				graphic = sprAttack1;
				sprAttack1.play("attack1",true,0);
				var regionX:int = 0;
				var regionY:int = 0;
				var regionW:int = 0;
				var regionH:int = 0;
				var regionType:String = "";
				var attackSeconds:Number = 0;

				if(_jumping)
				{ 
					_attackType = 3; 
					attackSeconds = 0.3;
					regionY = y;
					regionH = height;
					regionW = 10; //Change this to make range longer/shorter
					regionType = A.typPLAYERATTACK1;
					//set region dimensions
					//set attack time
					//Start jump attack anim
				} 
				else
				{
					//Could make this a three-hit-combo thing
					_attackType = 1;
					attackSeconds = 0.5;
					regionY = y;
					regionH = height;
					regionW = 10; //Change this to make range longer/shorter
					regionType = A.typPLAYERATTACK1;
					//start attack anim
				}

				//Acount for player's direction
				//Man this is rough
				if(_xDir > 0)
				{
					regionX = x + width;
					sprAttack1.flipped = false;
				}
				else
				{
					regionX = x + regionW;
					sprAttack1.flipped = true;
				}

				_damageRegion = new Region(regionX,regionY,regionW,regionH,regionType);

				_attacking = true;
				FP.world.add(_damageRegion);
				FP.alarm(attackSeconds,StopAttacking);
			}
		}

		private function RangedAttack():void
		{
		}

		private function StopAttacking():void
		{
			_attacking = false;
			FP.world.remove(_damageRegion);
			graphic = (Game.safe) ? sprStrum : sprIdle;
			sprIdle.play("idle");
			sprStrum.play("strum");
			sprIdle.flipped = sprStrum.flipped = (_xDir < 0);
		}

		/*Damage code stop here*/

		private function Jump():void
		{
			_vel.y = jump;
			_jumping = true;
		}
		
		private function CheckDamage():Boolean
		{
			var damaged:Boolean
			var ent:Entity = collide(A.typENEMYATTACK1,0,0);
			if(ent && !HasHit(ent))
			{
				--_life;
				_hasHit.push(ent); //Prevent one damage event from counting twice
			}
			ent = collide(A.typENEMYATTACK2,0,0);
			if(ent && !HasHit(ent))
			{
				_life -= 2;
				_hasHit.push(ent); //Prevent one damage event from counting twice
			} 

			return damaged;
		}

		private function ClampVel():void
		{
			var maxSpeed:Number;
			if (Game.safe)
			{
				maxSpeed = maxWalk;
			}
			else 
			{
				maxSpeed = maxRun;
			}
			if (Math.abs(vel.x) > maxSpeed) 
			{
				vel.x = FP.sign(vel.x) * maxSpeed;
			}
		} 

		protected function HasHit(ent:Entity):Boolean
		{
			for(var i:String in _hasHit)
			{
				if(_hasHit[i] == ent)
				{
					return true;
				}
			}
			return false;
		}
	} 
}
