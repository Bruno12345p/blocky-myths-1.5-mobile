import flixel.FlxSprite;

var origins:FlxSprite;
var moonlight:FlxSprite;

function createPost() {
	silhouette();

	origins = new FlxSprite().loadGraphic(Paths.image('stages/origins/night'));
	origins.scale.set(1.4, 1.4);
	origins.updateHitbox();
	origins.alpha = 0.0001;
	insert(game.members.indexOf(game.gfGroup), origins);

	moonlight = new FlxSprite().loadGraphic(Paths.image('stages/origins/MoonLight'));
	moonlight.scale.set(1.4, 1.4);
	moonlight.updateHitbox();
	moonlight.alpha = 0.0001;
	insert(game.members.indexOf(game.boyfriendGroup), moonlight);
	cacheChar('danger2', 0);
	cacheChar('herobrineog', 0);
}

function silhouette() {
	dad.colorTransform.color = 0xffffffff;
	boyfriend.colorTransform.color = 0xffffffff;
	gf.colorTransform.color = 0xffffffff;
	switch (game.isRaining) {
		case true:
			game.Stage.swagBacks['sky'].visible = false;
			game.Stage.swagBacks['rain'].visible = false;
		case false:
			origins.alpha = 0;
			moonlight.alpha = 0;
	}
}

function stopSilhouette() {
	dad.setColorTransform();
	boyfriend.setColorTransform();
	gf.setColorTransform();
	boyfriend.color = colorFromString('#c292e8');
	dad.color = colorFromString('#c292e8');
	gf.color = colorFromString('#c292e8');
	switch (game.isRaining) {
		case true:
			game.Stage.swagBacks['sky'].visible = true;
			game.Stage.swagBacks['rain'].visible = true;
		case false:
			origins.alpha = 1;
			moonlight.alpha = 1;
	}
}

function stepHit() {
	switch (curStep) {
		case 384:
			stopSilhouette();
			camHUD.flash();
			game.beat = true;
			game.zoomForTweens = 1;

		case 894:
			game.camGame.flash(); // for some reason, this doesn't work, i dont think camGame doesnt work with seconds
			createTween(boyfriend, {alpha: 0}, 0.1);
			createTween(gf, {alpha: 0}, 0.1);
			createTween(dad, {alpha: 0}, 0.1);
			createTween(camHUD, {alpha: 0}, 0.1);
			game.beat = false;

		case 896:
			silhouette();
			camGame.flash();

		case 964:
			createTween(dad, {alpha: 1}, 5);
			createTween(boyfriend, {alpha: 1}, 5);
			createTween(gf, {alpha: 1}, 5);
			createTween(camHUD, {alpha: 1}, 5);

		case 1152:
			stopSilhouette();
			camHUD.flash();
			game.beat = true;
			game.zoomForTweens = 0.55;

		case 1408:
			createTween(camGame, {alpha: 0}, 2);

		case 1430, 2178, 2320, 2356, 2988:
			game.zoomForTweens = 1;

		case 1440:
			createTween(camGame, {alpha: 1}, 0.1);
			camHUD.flash();

		case 1456, 2188, 2532:
			game.zoomForTweens = 0.55;

		case 1568, 2976:
			camGame.flash();

		case 1712, 3791:
			game.beat = false;

		case 1976:
			game.beat = true;
			game.zoomForTweens = 1;

		case 2016, 2542, 3000:
			game.zoomForTweens = 0.55;

		case 2306:
			game.zoomForTweens = 0.6;

		case 2432: // for step 2432, it changes stage and character fyi
			game.isRaining = false;
			game.Stage.swagBacks['sky'].visible = false;
			game.Stage.swagBacks['rain'].visible = false;
			origins.alpha = 1;
			moonlight.alpha = 1;
			game.zoomForTweens = 0.5;
			changeChar('herobrineog', 0, 1010, 440);
			boyfriend.setPosition(2370, 970);
			gf.setPosition(1810, 600);
			game.snapCamFollowToPos(1920, 900);
			silhouette();
			camGame.flash();

		case 2464:
			camGame.flash();
			stopSilhouette();
			boyfriend.color = colorFromString('#768fab');
			dad.color = colorFromString('#768fab');
			gf.color = colorFromString('#768fab');
		case 2975:
			camGame.flash();
			game.isRaining = true;
			game.zoomForTweens = 0.45;
			game.Stage.swagBacks['sky'].visible = true;
			game.Stage.swagBacks['rain'].visible = true;
			origins.alpha = 0;
			moonlight.alpha = 0;
			game.snapCamFollowToPos(2910, 1690);
			changeChar('danger1', 0, 1000, 890);
			boyfriend.setPosition(2920, 1480);
			gf.setPosition(3000, 1190);
			game.snapCamFollowToPos(1920, 900);
			Debug.logTrace("fart");
			boyfriend.color = colorFromString('#c292e8');
			dad.color = colorFromString('#c292e8');
			gf.color = colorFromString('#c292e8');
		case 2540, 2994:
			game.zoomForTweens = 0.8;
		case 3520:
			silhouette();
			game.zoomForTweens = 1;
			camGame.flash();

		case 3800:
			changeChar('danger2', 0, dad.x, dad.y);
			game.beat = true;
		case 3900:
			stopSilhouette();
			game.zoomForTweens = 0.55;

		case 4432:
			camHUD.flash();
	}
}
