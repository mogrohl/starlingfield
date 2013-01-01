package {
    import com.greensock.easing.Linear;
    import com.greensock.TweenNano;
    import starling.display.Image;
    import starling.display.Sprite;
    import starling.events.Event;
    import starling.textures.Texture;

    public class Star extends Sprite {
        private var m_Image:Image;

        public function Star() {
            if (parent === null) {
                addEventListener(Event.ADDED, Added);
            } else {
                Added();
            }
        }

        private function Added(e:Event = null):void {
            removeEventListener(Event.ADDED, Added);

            var scale:Number = Math.random() * 0.7 + 0.3;//0.3-1
            var img:Image = new Image(Assets.StarTexture);
            img.scaleX = scale;
            img.scaleY = scale;
            img.x -= img.width / 2;
            img.y -= img.height / 2;
            addChild(img);

            x = stage.stageWidth + width;
            y = Math.random() * (stage.stageHeight + (height * 2)) - height;
            alpha = Math.random() * 0.8;

            TweenNano.to(this, Math.random() * 4 + 12, //7-10s
                {
                    ease: Linear.easeNone,
                    x: -width,
                    rotation: (Math.random() * 28 + 4) - 16, //4-32
                    onComplete: RemoveFromStarfield
                } );
        }

        private function RemoveFromStarfield():void {
            parent.removeChild(this, true);
        }
    }
}