package;

import flixel.FlxG;
import flixel.text.FlxText;

using StringTools;

class BenGameOver extends MusicBeatSubstate
{
    var theText:FlxText;
    var allTheDialogues:Array<String> = [
        '',
        '',
        'do you remember me pcusername?',
        ''
    ];

    public function new()
    {
        super();

        for(i in allTheDialogues)
        {
            var dialogues:String = StringTools.replace(i, 'pcusername', CoolUtil.getpcUSER().toLowerCase());
        }

        theText = new FlxText(FlxG.width, FlxG.height, 0, '')
    }
}