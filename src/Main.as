package {
    import flash.display.Sprite;
    import flash.events.Event;
    import starling.core.Starling;

    public class Main extends Sprite {
        public function Main() {
            if (stage === null) {
                addEventListener(Event.ADDED_TO_STAGE, AddedToStage);
            } else {
                AddedToStage();
            }
        }

        private function AddedToStage(e:Event = null):void {
            removeEventListener(Event.ADDED_TO_STAGE, AddedToStage);

            var _starling:Starling = new Starling(Starfield, stage);
            _starling.showStats = true;
            _starling.start();
        }
    }
}