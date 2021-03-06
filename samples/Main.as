package
{
	import com.larrio.controls.layouts.EasyLayout;
	import com.larrio.controls.scrollers.bar.BarView;
	
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.ui.Keyboard;
	
	[SWF(width="1024", height="768", frameRate="60")]
	
	
	/**
	 * 
	 * @author larryhou
	 * @createTime Oct 8, 2013 8:55:40 PM
	 */
	public class Main extends Sprite
	{
		private var _layout:EasyLayout;
		
		/**
		 * 构造函数
		 * create a [Main] object
		 */
		public function Main()
		{
			_layout = new EasyLayout(SimpleItemRender, 5, 3,5,5,false, new BarView());
			addChild(_layout);
			
			var provider:Array = [];
			while (provider.length < 100) provider.push({id:provider.length + 1});
			
			_layout.dataProvider = provider;
			_layout.enabled = true;
			
			stage.addEventListener(KeyboardEvent.KEY_UP, upHandler);
		}
		
		protected function upHandler(e:KeyboardEvent):void
		{
			switch(e.keyCode)
			{
				case Keyboard.LEFT:
				{
					_layout.column--;
					break;
				}
					
				case Keyboard.RIGHT:
				{
					_layout.column++;
					break;
				}
					
				case Keyboard.UP:
				{
					_layout.row++;
					break;
				}
					
				case Keyboard.DOWN:
				{
					_layout.row--;
					break;
				}
					
				case Keyboard.SPACE:
				{
					_layout.layout.vgap += 5;
					_layout.layout.hgap += 5;
					break;
				}
			}
		}
	}
}