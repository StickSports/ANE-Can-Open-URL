package
{
	import com.sticksports.nativeExtensions.canOpenUrl.CanOpenUrl;

	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;

	
	[SWF(width='320', height='480', frameRate='30', backgroundColor='#000000')]
	
	public class CanOpenUrlExtensionTest extends Sprite
	{
		private var direction : int = 1;
		private var shape : Shape;
		private var feedback : TextField;
		
		private var buttonFormat : TextFormat;
		
		public function CanOpenUrlExtensionTest()
		{
			shape = new Shape();
			shape.graphics.beginFill( 0x666666 );
			shape.graphics.drawCircle( 0, 0, 100 );
			shape.graphics.endFill();
			shape.x = 0;
			shape.y = 240;
			addChild( shape );
			
			feedback = new TextField();
			var format : TextFormat = new TextFormat();
			format.font = "_sans";
			format.size = 16;
			format.color = 0xFFFFFF;
			feedback.defaultTextFormat = format;
			feedback.width = 320;
			feedback.height = 260;
			feedback.x = 10;
			feedback.y = 210;
			feedback.multiline = true;
			feedback.wordWrap = true;
			feedback.text = "Hello";
			addChild( feedback );
			
			addEventListener( Event.ENTER_FRAME, animate );

			createButtons();
		}
		
		private function createButtons() : void
		{
			var tf : TextField = createButton( "test iTunes" );
			tf.x = 10;
			tf.y = 10;
			tf.addEventListener( MouseEvent.MOUSE_DOWN, testITunes );
			addChild( tf );
			
			tf = createButton( "visit iTunes" );
			tf.x = 170;
			tf.y = 10;
			tf.addEventListener( MouseEvent.MOUSE_DOWN, visitITunes );
			addChild( tf );
			
			tf = createButton( "test twitter" );
			tf.x = 10;
			tf.y = 50;
			tf.addEventListener( MouseEvent.MOUSE_DOWN, testTwitter );
			addChild( tf );
			
			tf = createButton( "visit twitter" );
			tf.x = 170;
			tf.y = 50;
			tf.addEventListener( MouseEvent.MOUSE_DOWN, visitTwitter );
			addChild( tf );
			
			tf = createButton( "test fb" );
			tf.x = 10;
			tf.y = 90;
			tf.addEventListener( MouseEvent.MOUSE_DOWN, testFacebook );
			addChild( tf );
			
			tf = createButton( "visit fb" );
			tf.x = 170;
			tf.y = 90;
			tf.addEventListener( MouseEvent.MOUSE_DOWN, visitFacebook );
			addChild( tf );
		}
		
		private function createButton( label : String ) : TextField
		{
			if( !buttonFormat )
			{
				buttonFormat = new TextFormat();
				buttonFormat.font = "_sans";
				buttonFormat.size = 14;
				buttonFormat.bold = true;
				buttonFormat.color = 0xFFFFFF;
				buttonFormat.align = TextFormatAlign.CENTER;
			}
			
			var textField : TextField = new TextField();
			textField.defaultTextFormat = buttonFormat;
			textField.width = 140;
			textField.height = 30;
			textField.text = label;
			textField.backgroundColor = 0xCC0000;
			textField.background = true;
			textField.selectable = false;
			textField.multiline = false;
			textField.wordWrap = false;
			return textField;
		}
		
		private function testITunes( event : MouseEvent ) : void
		{
			if( CanOpenUrl.canOpen( "itms-apps://itunes.apple.com/app/stick-cricket/id406781620?ls=1&mt=8" ) )
			{
				feedback.text = "Can open itms-apps://itunes.apple.com/app/stick-cricket/id406781620?ls=1&mt=8";
			}
			else
			{
				feedback.text = "Cannot open itms-apps://itunes.apple.com/app/stick-cricket/id406781620?ls=1&mt=8";
			}
		}
		
		private function visitITunes( event : MouseEvent ) : void
		{
			navigateToURL( new URLRequest( "itms-apps://itunes.apple.com/app/stick-cricket/id406781620?ls=1&mt=8" ) );
			feedback.text = "Visiting itms-apps://itunes.apple.com/app/stick-cricket/id406781620?ls=1&mt=8";
		}
		
		private function testTwitter( event : MouseEvent ) : void
		{
			if( CanOpenUrl.canOpen( "twitter://user?screen_name=sticksports" ) )
			{
				feedback.text = "Can open twitter://user?screen_name=sticksports";
			}
			else
			{
				feedback.text = "Cannot open twitter://user?screen_name=sticksports";
			}
		}
		
		private function visitTwitter( event : MouseEvent ) : void
		{
			navigateToURL( new URLRequest( "twitter://user?screen_name=sticksports" ) );
			feedback.text = "Visiting twitter://user?screen_name=sticksports";
		}
		
		private function testFacebook( event : MouseEvent ) : void
		{
			if( CanOpenUrl.canOpen( "fb://page/6340028662" ) )
			{
				feedback.text = "Can open fb://page/6340028662";
			}
			else
			{
				feedback.text = "Cannot open fb://page/6340028662";
			}
		}
		
		private function visitFacebook( event : MouseEvent ) : void
		{
			navigateToURL( new URLRequest( "fb://page/6340028662" ) );
			feedback.text = "Visiting fb://page/6340028662";
		}
		
		private function animate( event : Event ) : void
		{
			shape.x += direction;
			if( shape.x <= 0 )
			{
				direction = 1;
			}
			if( shape.x > 320 )
			{
				direction = -1;
			}
		}
	}
}