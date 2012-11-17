package  
{

	public class A 
	{
		// graphics
		// [Embed(source = '../assets/graphics/graphic.png')] static public const gfxGRAPHIC:Class;

		// audio
		[Embed(source = '../assets/audio/soft.mp3')] static public const sndSOFT:Class;
		[Embed(source = '../assets/audio/hard.mp3')] static public const sndHARD:Class;

		// collision types
		static public const typPLAYER:String = "player";
		static public const typSOLID:String = "solid";

		// graphic layers
		// static public const lyrDEPTH:int = depth;

		// fonts
		// [Embed(source = '../assets/misc/font.ttf', fontName = 'fntFONT', embedAsCFF='false', fontFamily = 'default')] private const F1:Class;
		
		// levels
		// [Embed(source = '../assets/levels/Level1.oel', mimeType = 'application/octet-stream')] static public const L1:Class;
		// static public const LEVELS:Array = [L1];
	}

}
