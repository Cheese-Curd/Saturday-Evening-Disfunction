package;

import flixel.FlxG;

// WHAT AM I DOING -cheese
// Don't complain about this being a lazy way to do it, I told her to do it this way fucker -angel
class AngelSubstate extends MusicBeatSubstate
{

    override function create()
    {
        super.create();
        trace("hi angel ♥");

        var categoryText:Alphabet = new Alphabet(FlxG.width + FlxG.width / 2, 300, "???", true);
        categoryText.isMenuItem = true;
        categoryText.targetY = -1;
        categoryText.changeX = false;
        categoryText.snapToPosition();
        categoryText.alignment = CENTERED;
        add(categoryText);

        var optionText:Alphabet = new Alphabet(0, 300, "Angel Bot", false);
        optionText.isMenuItem = true;
        optionText.targetY = 0;
        optionText.changeX = false;
        optionText.snapToPosition();
        optionText.screenCenter(X);
        optionText.x += FlxG.width - 70;
        add(optionText);

        var icon:AttachedSprite = new AttachedSprite('credits/angelbot');
        icon.xAdd = optionText.width + 10;
        icon.sprTracker = optionText;
        add(icon);
    }

    override function update(elapsed:Float)
    {
        super.update(elapsed);
 
        (cast FlxG.state).descBox.update(); // fukin stupid -angel

        if (controls.UI_LEFT)
        {
            close();
        }

        if (controls.BACK)
        {
            FlxG.sound.play(Paths.sound('cancelMenu'));
            MusicBeatState.switchState(new MainMenuState());
        }
    }
}