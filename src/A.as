package  
{

	public class A 
	{
		//====================graphics===============
		//=====================PLAYER================
		[Embed(source = '../assets/graphics/youJump.png')] static public const gfxPLAYERJUMP:Class;
		[Embed(source = '../assets/graphics/youIdle_strip2.png')] static public const gfxPLAYERIDLE:Class;
		[Embed(source = '../assets/graphics/youStill_strip2.png')] static public const gfxPLAYERSTILL:Class;
		[Embed(source = '../assets/graphics/youRun_strip4.png')] static public const gfxPLAYERRUN:Class;
		[Embed(source = '../assets/graphics/youAttack_strip8.png')] static public const gfxPLAYERATTACK1:Class;
		[Embed(source = '../assets/graphics/youStrum_strip2.png')] static public const gfxPLAYERSTRUM:Class;
		[Embed(source = '../assets/graphics/jumpAttack_strip11.png')] static public const gfxPLAYERJUMPATTACK:Class;
		[Embed(source = '../assets/graphics/youAirattack_strip5.png')] static public const gfxPLAYERAIRATTACK:Class;
		
		//================Background graphics=========
		[Embed(source = '../assets/graphics/HillNear.png')] static public const gfxHILLNEAR:Class;
		[Embed(source = '../assets/graphics/HillNearDark.png')] static public const gfxHILLNEARDARK:Class;
		[Embed(source = '../assets/graphics/HillFar.png')] static public const gfxHILLFAR:Class;
		[Embed(source = '../assets/graphics/HillFarDark.png')] static public const gfxHILLFARDARK:Class;
		[Embed(source = '../assets/graphics/LightBackground.png')] static public const gfxLIGHTBACKGROUND:Class;
		[Embed(source = '../assets/graphics/DarkBackground.png')] static public const gfxDARKBACKGROUND:Class;

		//================Enemy graphics=========
		[Embed(source = '../assets/graphics/enemySmall_strip4.png')] static public const gfxIMP:Class;
		[Embed(source = '../assets/graphics/enemyTwo.png')] static public const gfxCYMBAL:Class;
		[Embed(source = '../assets/graphics/demon.png')] static public const gfxBIG:Class;

		// audio
		[Embed(source = '../assets/audio/Calm1.mp3')] static public const sndSOFT1:Class;
		[Embed(source = '../assets/audio/Calm2.mp3')] static public const sndSOFT2:Class;
		[Embed(source = '../assets/audio/PowerShort.mp3')] static public const sndHARD1:Class;
		[Embed(source = '../assets/audio/PowerLong.mp3')] static public const sndHARD2:Class;

		// collision types
		static public const typPLAYER:String = "player";
		static public const typPLAYERATTACK1:String = "pattack1";
		static public const typPLAYERATTACK2:String = "pattack2";
		static public const typENEMYATTACK1:String = "eattack1";
		static public const typENEMYATTACK2:String = "eattack2";
		static public const typSOLID:String = "solid";
		static public const typENEMY:String = "enemy";

		// graphic layers
		// static public const lyrDEPTH:int = depth;

		// fonts
		//[Embed(source = '../assets/misc/HIGHLA2.ttf', fontName = 'fntHIGHLA2', embedAsCFF='false', fontFamily = 'default')] private const F1:Class;
		
		//[Embed(source = '../assets/misc/SHAXIZOR.ttf', fontName = 'yourMum', embedAsCFF = "false", fontFamily = 'fntHIGHLA2')] F1:Class;
		// levels
		// [Embed(source = '../assets/levels/Level1.oel', mimeType = 'application/octet-stream')] static public const L1:Class;
		// static public const LEVELS:Array = [L1];
	}
}
