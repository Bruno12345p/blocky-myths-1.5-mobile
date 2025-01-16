import flixel.util.FlxColor;

function createPost() {
	silhouette();
	game.hideHUD(false);
	game.zoomForTweens = 0.7;

	cacheChar('Heroin', 0);
	cacheChar('affbf', 1);

	game.fard = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
	game.fard.cameras = [game.camHUD];
	add(game.fard);
	// notch 2000, 1050
	// brine 300, 1100
	// bf 4000, 1375
}

function silhouette() {
	dad.colorTransform.color = 0xffffffff;
	boyfriend.colorTransform.color = 0xffffffff;
	gf.colorTransform.color = 0xffffffff;
	game.Stage.swagBacks['sky'].visible = false;
	game.Stage.swagBacks['rain'].visible = false;
}

function stopSilhouette() {
	dad.setColorTransform();
	boyfriend.setColorTransform();
	gf.setColorTransform();
	boyfriend.color = colorFromString('#c292e8');
	dad.color = colorFromString('#c292e8');
	gf.color = colorFromString('#c292e8');
	game.Stage.swagBacks['sky'].visible = true;
	game.Stage.swagBacks['rain'].visible = true;
}

function stepHit() {
	switch (curStep) {
		case 40:
			createTween(game.fard, {alpha: 0}, 8, {ease: FlxEase.quadOut});

		case 249:
			stopSilhouette();
			camHUD.flash();
			game.zoomForTweens = 0.4;
			game.hideHUD(true);

		case 281, 313, 345, 521, 653, 777, 1161:
			camGame.flash();

		case 265:
			game.beat = true;
			game.stepsBetween = 16;

		case 377:
			game.beat = false;
			game.zoomForTweens = 1;

		case 395:
			game.beat = true;
			camGame.flash();
			game.stepsBetween = 4;
			game.zoomForTweens = 0.4;
			game.changeCameraFocus(dad);

		case 905:
			camGame.flash();
			game.zoomForTweens = 1;

		case 969:
			game.zoomForTweens = 0.4;

		case 1425, 1876, 1908, 1940, 1972, 2004, 2036, 2068, 2212:
			game.beat = false;

		case 1288:
			game.beat = false;
			camGame.alpha = 0;

		case 1297:
			game.beat = true;
			camGame.flash();
			createTween(camGame, {alpha: 1}, 0.1);

		case 1440:
			game.changeCameraFocus(dad);
			game.autoMoveCam = false;
			game.zoomForTweens = 1;
			camHUD.flash(0xffffff, 0.3);
			camGame.visible = false;
			changeChar('Heroin', 0, 300, 1100);
			changeChar('affbf', 1, 4000, 1375);
			gf.visible = false;
			game.notch.alpha = 1.0;
			game.Stage.swagBacks['sky'].visible = false;
			game.Stage.swagBacks['rain'].visible = false;

		case 1460:
			camGame.visible = true;
		case 1828:
			camGame.flash();
			game.beat = true;
			game.stepsBetween = 8;

		case 1823, 2210:
			game.notchSinging = false;
			game.changeCameraFocus(dad);
		case 1956, 2276:
			game.notchSinging = true;
			game.changeCameraFocus(game.notch);
		case 2084:
			game.notchSinging = false;
			game.changeCameraFocus(boyfriend);

		case 1844:
			// game.zoomForTweens = 0.7;
			game.beat = false;

		case 1860:
			game.beat = true;

		case 1892, 1924, 1960, 1988, 2020, 2052:
			game.beat = true;
		case 2400:
			overlayCam.flash(0x000000);
			camGame.visible = false;
			game.notch.visible = false;	
			game.autoMoveCam = true;

		case 2416: // stage change
			overlayCam.flash(0xffffff);
			camGame.visible = true;
			game.zoomForTweens = 0.5;
			changeChar('herobrineCape', 0, 1140, 940);
			gf.visible = true;
			changeChar('bf-NUP', 1, 2920, 1480);
			game.Stage.swagBacks['sky'].visible = true;
			game.Stage.swagBacks['rain'].visible = true;

		case 2084:
			game.beat = true;
			game.stepsBetween = 4;

		case 2506:
			game.beat = true;
			game.stepsBetween = 8;
			camGame.flash();

		case 2570:
			camGame.flash();
			game.stepsBetween = 4;

		case 2826:
			silhouette();
			camGame.flash();
			game.zoomForTweens = 0.8;
			game.stepsBetween = 8;

		case 2954:
			game.stepsBetween = 4;

		case 3018:
			camHUD.flash();
			createTween(camGame, {alpha: 0}, 0.1);
			createTween(camHUD, {alpha: 0}, 6);
	}
}
