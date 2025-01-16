import flixel.addons.effects.FlxTrail;
import flixel.addons.effects.FlxTrailArea;
import flixel.tweens.FlxEase;
import flixel.util.FlxColor;
import kec.backend.Constants;
import kec.objects.note.Note;

var whitebg:FlxSprite;
var bfTrail:FlxTrail;
var dadTrail:FlxTrail;

function create() {
	whitebg = new FlxSprite().makeGraphic(Constants.scaledWidth, Constants.scaledHeight, FlxColor.WHITE);
	whitebg.cameras = [game.camHUD];
	whitebg.alpha = 0;
	add(whitebg);
	game.fard = new FlxSprite().makeGraphic(Constants.scaledWidth, Constants.scaledHeight, FlxColor.BLACK);
	game.fard.cameras = [game.camHUD];
	add(game.fard);
	bfTrail = new FlxTrail(boyfriend, null, 3, 6, 0.3, 0.002);
	dadTrail = new FlxTrail(dad, null, 3, 6, 0.3, 0.002);
	insert(boyfriend, 1, bfTrail);
	insert(dad, 1, dadTrail);
	bfTrail.visible = false;
	dadTrail.visible = false;
	add(bfTrail);
	add(dadTrail);
	cacheChar('herobrineCape', 0);
	// 1140 940
}

function stepHit() {
	switch (curStep) {
		case 32:
			createTween(game.fard, {alpha: 0}, 4, {ease: FlxEase.quadOut});
		case 288:
			createTween(game.fard, {alpha: 1}, 4, {ease: FlxEase.quadOut});
			game.zoomForTweens = 0.95;
		case 354:
			game.fard.alpha = 0;
			FlxG.camera.flash(FlxColor.WHITE, 1);
		case 364 | 380 | 396 | 492:
			game.zoomForTweens = 0.7;
			FlxG.camera.shake(0.05, 0.05);
		case 400 | 524:
			game.zoomForTweens = 0.71;
			FlxG.camera.shake(0.05, 0.05);
		case 409:
			game.zoomForTweens = 0.72;
			FlxG.camera.shake(0.05, 0.05);
		case 370 | 386 | 480 | 498:
			game.zoomForTweens = 0.8;
			FlxG.camera.shake(0, 0);
		case 578 | 2112:
			createTween(whitebg, {alpha: 0.6}, 2, {ease: FlxEase.quadOut});
		case 608 | 2144:
			createTween(whitebg, {alpha: 0}, 0.2, {ease: FlxEase.quadOut});
			FlxG.camera.flash(FlxColor.WHITE, 1);
		case 856:
			game.zoomForTweens = 0.72;
		case 768 | 2043:
			FlxG.camera.flash(FlxColor.WHITE, 1);
		case 2144:
			bfTrail.visible = true;
			dadTrail.visible = true;
		case 864:
			FlxG.camera.flash(FlxColor.WHITE, 1);
			bfTrail.visible = true;
			dadTrail.visible = true;
		case 1116:
			game.zoomForTweens = 0.76;
		case 1120:
			createTween(game.fard, {alpha: 1}, 0.15, {ease: FlxEase.quadOut});
		case 1128:
			createTween(game.fard, {alpha: 0}, 4, {ease: FlxEase.quadOut});
			bfTrail.visible = false;
			dadTrail.visible = false;
		case 1308 | 1368:
			game.zoomForTweens = 0.7;
		case 1632:
			FlxG.camera.flash(FlxColor.WHITE, 1);
		case 2143:
			changeChar('herobrineCape', 0, 1140, 940);
		case 2656:
			bfTrail.visible = false;
			dadTrail.visible = false;
			FlxG.camera.flash(FlxColor.WHITE, 1);
			createTween(game.fard, {alpha: 1}, 6, {ease: FlxEase.quadOut});
	}
}
