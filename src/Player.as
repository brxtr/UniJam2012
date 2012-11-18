package  
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	import net.flashpunk.FP;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;

	public class Player extends Mover 
	{
		private var _life:int;
		private var spr:Image = new Image(A.gfxPLAYER);
		
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
			_attackType = 0;
			
			// TODO: change to spritemap and add animations
			
			graphic = spr;
			
			setHitbox(spr.width, spr.height);
			type = A.typPLAYER;
			
			Input.define("jump", Key.UP, Key.W);
			Input.define("left", Key.LEFT, Key.A);
			Input.define("right", Key.RIGHT, Key.D);
			Input.define("melee", Key.SHIFT, Key.X);
			Input.define("melee", Key.CONTROL, Key.C);
		}
		
		override public function update():void
		{
			if (Input.check("left"))
			{
				_vel.x -= _acc.x;
				_xDir = -1;
			}
			if (Input.check("right"))
			{
				_vel.x += _acc.x;
				_xDir = 1;
			}
			
			if(collide(A.typSOLID, x, y + 1))
			{
				if(_jumping)
				{
					_jumping = false;
				}
				if (Input.check("jump"))
				{
					Jump();
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
					break;
				case 2:
					break;
				case 3:
					break;
				default:
					break;
				}
			}

			if(Input.check("melee"))
			{
				MeleeAttack();
			}
			else if(Input.check("ranged"))
			{
				RangedAttack();
			}
		}
			
		private function MeleeAttack():void
		{
			if(!_attacking)
			{
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
					attackSeconds = 0.3;
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
				}
				else
				{
					regionX = x;
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
