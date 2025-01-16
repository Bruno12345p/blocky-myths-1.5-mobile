import kec.backend.Constants;

var fard:FlxSprite;
var overlay:FlxSprite;
var shitHitTheFan:Bool = false;

function createPost() {
	fard = new FlxSprite().makeGraphic(1, 1, colorFromString('black'));
	fard.setGraphicSize(Constants.scaledWidth, Constants.scaledHeight);
	fard.updateHitbox();
	fard.screenCenter();
	fard.camera = camHUD;
	fard.alpha = 0.0001;
	insert(30, fard);

	overlay = new FlxSprite().loadGraphic(Paths.image('credshit/overlay'));
	overlay.screenCenter();
	overlay.camera = game.overlayCam;
	overlay.alpha = 0.75;
	insert(30, overlay);
	game.hideHUD(false);
	game.snapCamFollowToPos(3000, 1200);

	game.beat = game.camZooming = false;
	game.stepsBetween = 8;
	game.iconBop = false;
	game.iconScale = 1;
	cacheChar('notchGod', 1);
}

function stepHit() {
	switch (curStep) {
		case 120:
			game.autoMoveCam = false;
			game.snapCamFollowToPos(3000, 1200);
		case 128:
			undoBNW();
			game.zoomForTweens -= 0.15;
			createTween(fard, {alpha: 0.2}, 4);
			createTween(overlay, {alpha: 0.4}, 4);
		case 160:
			game.changeCameraFocus(boyfriend);
		case 192:
			game.changeCameraFocus(dad);
		case 224:
			game.changeCameraFocus(boyfriend);
		case 255:
			game.autoMoveCam = true;
			game.changeCameraFocus(dad);
			game.stepsBetween = 32;
			doZooms(true);
		case 256:
			game.zoomForTweens += 0.05;
			game.hideHUD(true);
		case 383:
			game.stepsBetween = 8;
		case 447:
			game.stepsBetween = 4;
		case 479:
			game.stepsBetween = 2;
		case 495:
			game.stepsBetween = 8;
			doZooms(false);
		case 496, 504:
			game.zoomForTweens += 0.05;
		case 512:
			game.overlayCam.flash();
			doZooms(true);
		case 640:
			camHUD.flash();
			createTween(overlay, {alpha: 0.75}, 5);
		case 704:
			game.zoomForTweens += 0.05;
		case 751, 2031:
			game.stepsBetween = 4;
		case 768:
			camGame.flash();
			overlay.alpha = 0;
			fard.alpha = 0;
		case 1010, 1792:
			game.stepsBetween = 8;
		case 1020:
			game.stepsBetween = 16;
			zoom();
		case 1264:
			game.zoomForTweens += 0.05;
			zoom();
		case 1028, 1092, 1156, 1224:
			zoom();
		case 1279:
			game.stepsBetween = 8;
		case 1392:
			game.zoomForTweens += 0.1;
		case 1280, 1288, 1296, 1312, 1320, 1328, 1368, 1376, 1408, 1440, 1448, 1456, 1512, 1520, 1528, 3104, 3112, 3120:
			game.zoomForTweens -= 0.05;
		case 1304, 1432, 1560, 1616, 1688, 1744, 2872, 3001, 3128, 3184, 3256, 3312:
			game.zoomForTweens += 0.05;
			camGame.shake();
		case 1344, 1392, 1472, 1496:
			game.zoomForTweens += 0.1;
		case 1408, 1536:
			game.overlayCam.flash();
		case 1488:
			zoom();
		case 2284:
			game.changeCameraFocus(boyfriend);
		case 2287:
			boyfriend.specialAnim = true;
			boyfriend.playAnim('eat');
			shitHitTheFan = true;
		case 2300:
			game.overlayCam.flash(colorFromString('black'), 1.5);
			game.Stage.swagBacks['rain'].alpha = 1;
			game.isRaining = true;
			changeChar('notchGod', 1, boyfriend.x + 150, boyfriend.y - 700);
		case 2302:
			overlay.alpha = 0;
			game.stepsBetween = 4;
			game.zoomForTweens = 0.45;
		case 2543:
			doZooms(false);
		case 2544:
			createTween(dad, {x: dad.x + 100, y: dad.y - 100}, 1);
		case 2560:
			doZooms(true);
			game.zoomForTweens += 0.05;
		case 2815:
			doZooms(false);
			game.zoomForTweens += 0.05;
			createTween(overlay, {alpha: 0.75}, 1.25);
			shitHitTheFan = false;
		case 2848:
			game.stepsBetween = 8;
			doZooms(true);
			game.overlayCam.flash();
			overlay.alpha = 0.5;
			fard.alpha = 0.2;
		case 3360:
			game.overlayCam.flash();
			overlay.alpha = 0;
			fard.alpha = 0;
			game.stepsBetween = 64;
			boyfriend.specialAnim = true;
			boyfriend.playAnim('land', true);
		case 3366:
			createTween(dad, {x: dad.x - 100, y: dad.y + 100}, 1);
		case 3384:
			changeChar('notch', 1, boyfriend.x - 150, boyfriend.y + 700);
		case 3920:
			createTween(overlay, {alpha: 1}, 3);
			createTween(fard, {alpha: 1}, 3);
	}
}

function doZooms(b:Bool) {
	game.camZooming = game.beat = game.iconBop = b;
}

function countTick(tick:Int) {
	trace(tick);
	if (tick % 2 == 0)
		game.changeCameraFocus(boyfriend);
	else
		game.changeCameraFocus(dad);

	game.zoomForTweens += 0.05;

	if (tick == 0) {
		blackNWhite();
		createTween(fard, {alpha: 1}, 0.2, {startDelay: 0.3, ease: FlxEase.quartOut});
	}
}

// sobbing because this is only used for the intro
function blackNWhite() {
	dad.colorTransform.color = 0xffffffff;
	boyfriend.colorTransform.color = 0xffffffff;
	for (obj in game.Stage.swagBacks.keys()) {
		game.Stage.swagBacks[obj].visible = false;
	}
}

function undoBNW() {
	dad.setColorTransform();
	boyfriend.setColorTransform();
	boyfriend.color = colorFromString('#6f7eb3');
	dad.color = colorFromString('#6f7eb3');
	for (obj in game.Stage.swagBacks.keys()) {
		game.Stage.swagBacks[obj].visible = true;
	}
}

function zoom() {
	camGame.zoom += 0.05;
	camHUD.zoom += 0.05;
}

function opponentNoteHit(n:NoteDef) {
	if (!shitHitTheFan)
		return;

	camGame.shake(0.007);
}
