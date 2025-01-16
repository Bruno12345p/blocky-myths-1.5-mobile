import flixel.util.FlxColor;

var upperBar:FlxSprite;
var downBar:FlxSprite;

// out of any functions
function createPost() {
	upperBar = new FlxSprite(-110, -350).makeGraphic(1500, 350, FlxColor.BLACK);
	upperBar.camera = camHUD;
	downBar = new FlxSprite(-110, 720).makeGraphic(1500, 350, FlxColor.BLACK);
	downBar.camera = camHUD;
	add(upperBar);
	add(downBar);
}

function cinematicBars() {
	createTween(upperBar, {y: upperBar.y + 90}, 0.5, {ease: FlxEase.quadOut});
	createTween(downBar, {y: downBar.y - 90}, 0.5, {ease: FlxEase.quadOut});
}

function stopCinematicBars() {
	createTween(upperBar, {y: upperBar.y - 90}, 0.5, {ease: FlxEase.quadOut});
	createTween(downBar, {y: downBar.y + 90}, 0.5, {ease: FlxEase.quadOut});
}

function silhouette() {
	dad.colorTransform.color = 0x00000000;
	boyfriend.colorTransform.color = 0x00000000;
	gf.colorTransform.color = 0x00000000;
	game.Stage.swagBacks['sky'].colorTransform.color = 0xFFFFFFFF;
}

function stopSilhouette() {
	dad.setColorTransform();
	boyfriend.setColorTransform();
	gf.setColorTransform();
	game.Stage.swagBacks['sky'].setColorTransform();
}

function stepHit() {
	switch (curStep) {
		/*case 4:
			createTween(camGame, {alpha: 1}, 5); */

		case 256:
			camHUD.flash();
			game.beat = true;

		case 383, 1664, 1920:
			game.zoomForTweens = 1;
			cinematicBars();

		case 400, 1680, 1935:
			game.zoomForTweens = 0.4;
			camHUD.flash();
			stopCinematicBars();

		case 512, 640, 1792:
			camGame.flash();

		case 767:
			camGame.flash();
			silhouette();
			cinematicBars();
			game.zoomForTweens = 0.55;

		case 894:
			game.zoomForTweens = 0.4;

		case 1024:
			stopSilhouette();
			camHUD.flash();
			stopCinematicBars();

		case 1280:
			camHUD.flash();
			cinematicBars();

		case 1535:
			camHUD.flash();
			stopCinematicBars();

		case 2048:
			camHUD.flash();
			camGame.visible = false;
			createTween(camHUD, {alpha: 0}, 4);
			game.beat = false;
	}
}
