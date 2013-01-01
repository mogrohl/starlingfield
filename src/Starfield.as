package {
    import flash.events.TimerEvent;
    import flash.utils.Timer;
    import starling.core.Starling;
    import starling.display.Sprite;
    import starling.events.EnterFrameEvent;
    import starling.events.Event;
    import starling.events.KeyboardEvent;

    public class Starfield extends Sprite {
        public static var Limit:uint = 256;

        private var m_AddStarTimer:Timer;

        public function Starfield() {
            if (parent === null) {
                addEventListener(Event.ADDED, Added);
            } else {
                Added();
            }
        }

        private function Added(e:Event = null):void {
            removeEventListener(Event.ADDED, Added);

            m_AddStarTimer = new Timer(200, 1);
            m_AddStarTimer.addEventListener(TimerEvent.TIMER_COMPLETE, AddStar);

            addEventListener(EnterFrameEvent.ENTER_FRAME, Update);
            stage.addEventListener(KeyboardEvent.KEY_DOWN, function(e:KeyboardEvent):void {
                Starling.current.showStats = !Starling.current.showStats;
            });
        }

        private function Update(e:EnterFrameEvent):void {
            if (numChildren < Limit) {
                if (!m_AddStarTimer.running) {
                    m_AddStarTimer.start();
                }
            }
        }

        private function AddStar(e:TimerEvent):void {
            addChild(new Star());
        }
    }
}