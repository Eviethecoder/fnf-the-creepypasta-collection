package;

import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.group.FlxSpriteGroup;
import flixel.FlxSprite;

class VhsSpriteSubState extends FlxSpriteGroup
{
    public function new(x:Float = 0, y:Float = 0)
    {
        super();
        this.x = x;
        this.y = y;
        
        var vhs:FlxSprite = new FlxSprite();
        vhs.frames = Paths.getSparrowAtlas('vintage', 'creepy');
        vhs.setGraphicSize(FlxG.width, FlxG.height);
        vhs.scrollFactor.set();
        vhs.animation.addByPrefix('vhsloop', 'idle');
        vhs.animation.play('vhsloop');
        vhs.alpha = 0.8;
        vhs.screenCenter();
        add(vhs);
    }

    override public function update(elapsed:Float)
    {
        super.update(elapsed);
    }
}