package;
#if sys
import flixel.addons.transition.FlxTransitionableState;
import flixel.util.FlxTimer;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import sys.FileSystem;

// kade come back
class LoadingScreen extends MusicBeatState
{
    var voices = [];
    var inst = [];
    var songs = [];
    var done:Int = 0;
    var toBeDone:Int = 0;
    var statusText:FlxText;
    var nextState:MusicBeatState = null;

    public function new(nextState:MusicBeatState)
    {
        super();

        this.nextState = nextState;
    }

    override public function create()
    {
        super.create();

        var blueblueblue:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLUE);
        blueblueblue.screenCenter();
        blueblueblue.scrollFactor.set();
        add(blueblueblue);

        var loadingText:FlxText = new FlxText(FlxG.width, FlxG.height, 0, 'Loading Songs...', 45);
        loadingText.setFormat(Paths.font('vcr.ttf'), 45, FlxColor.WHITE, CENTER);
        loadingText.screenCenter(Y);
        loadingText.y -= 100;
        add(loadingText);

        statusText = new FlxText(FlxG.width, FlxG.height, 0, '', 45);
        statusText.setFormat(Paths.font('vcr.ttf'), 45, FlxColor.WHITE, CENTER);
        statusText.screenCenter(Y);
        add(statusText);

        FlxTransitionableState.skipNextTransIn = true;
        FlxTransitionableState.skipNextTransOut = true;

        songs = loadMusic();

        toBeDone = Lambda.count(songs);

        sys.thread.Thread.create(() ->
		{
			cache();
		});
    }

    function loadMusic()
    {
        for (i in FileSystem.readDirectory(FileSystem.absolutePath("assets/songs")))
		{
			songs.push(i);
		}
    }

    function cache()
    {
        for(i in songs)
        {
            var inst = Paths.inst(i);
			if (Paths.fileExists(inst, SOUND))
			{
				FlxG.sound.cache(inst);
			}

			var voices = Paths.voices(i);
			if (Paths.fileExists(voices, SOUND))
			{
				FlxG.sound.cache(voices);
			}

            done++;
        }
    }
}
#end