import kec.backend.Constants;

var precache:Array<String> = [
	'stages/templeA/1',
	'stages/templeA/2',
	'stages/templeA/3',
	'stages/templeA/sky',
	'stages/templeN/1',
	'stages/templeN/2',
	'stages/templeN/3',
	'stages/templeN/4',
	'stages/templeN/5',
	'stages/templeN/Rain_BM'
];

function createPost() {
	for (img in precache) {
		Debug.logTrace("caching " + img);
		game.precacheThing(img, "image");
	}

	fard = new FlxSprite().makeGraphic(1, 1, colorFromString('black'));
	fard.setGraphicSize(Constants.scaledWidth, Constants.scaledHeight);
	fard.updateHitbox();
	fard.screenCenter();
	fard.camera = camHUD;
	fard.alpha = 0.0001;
	insert(30, fard);

	// stageChange('templeA');
}

function stageChange(st:String) {
	for (i in game.Stage.toAdd) {
		game.remove(i, true);
	}

	for (i => array in game.Stage.layInFront) {
		for (bg in array)
			game.remove(bg, true);
	}

	game.remove(game.dadGroup);
	game.remove(game.boyfriendGroup);
	game.remove(game.gfGroup);

	game.Stage.destroy();
	game.Stage = null;

	game.Stage = new Stage(st);
	game.Stage.initStageProperties();
	game.Stage.loadStageData(st);
	game.Stage.inEditor = false;

	if (FlxG.save.data.background) {
		for (i in game.Stage.toAdd) {
			game.add(i);
		}

		for (index => array in game.Stage.layInFront) {
			switch (index) {
				case 0:
					if (gf != null) {
						game.add(game.gfGroup);
					}
					for (bg in array)
						game.add(bg);
				case 1:
					game.add(game.dadGroup);
					for (bg in array)
						game.add(bg);
				case 2:
					game.add(game.boyfriendGroup);
					for (bg in array)
						game.add(bg);
			}
		}
	}
}

function stepHit() {
	switch (curStep) {
		case 336:
			createTween(fard, {alpha: 0.8}, 3.5);
			FlxTween.tween(FlxG.camera, {zoom: 0.95}, 4, {ease: FlxEase.quadOut});

		case 384:
			fard.alpha = 0;
			camGame.flash();
			game.zoomForTweens = 0.35;

		case 388:
			game.beat = true;

		case 879:
			game.beat = false;

		case 895:
			camGame.flash();
			game.beat = true;

		case 1023:
			camGame.flash();

		case 1104:
			createTween(fard, {alpha: 0.8}, 3.5);
			game.zoomForTweens = 0.5;

		case 1157:
			fard.alpha = 0;
			createTween(camGame, {alpha: 0}, 0.2);
			game.beat = false;

		case 1168:
			stageChange('templeA');

		case 1195:
			createTween(camGame, {alpha: 1}, 2);

		case 1280:
			game.beat = true;
			game.stepsBetween = 4;

		case 1488:
			createTween(fard, {alpha: 0.8}, 3.5);

		case 1536:
			createTween(camGame, {alpha: 0}, 0.1);
			fard.alpha = 0;

		case 1552:
			createTween(camGame, {alpha: 1}, 0.1);
			camHUD.flash();
			game.stepsBetween = 8;
			game.zoomForTweens = 0.35;

		case 1664, 1792, 2224, 2352:
			game.zoomForTweens = 0.55;

		case 1672, 1800, 2256:
			game.zoomForTweens = 0.35;

		case 1807:
			camGame.flash();

		case 1999:
			createTween(fard, {alpha: 0.8}, 4);

		case 2064:
			fard.alpha = 0;
			camGame.flash();
			game.stepsBetween = 32;

		case 2144:
			createTween(fard, {alpha: 0.8}, 3.5);

		case 2192:
			fard.alpha = 0;
			camGame.flash();
			game.beat = false;
			stageChange('templeN');

		case 2384:
			createTween(fard, {alpha: 0.8}, 6);

		case 2448:
			fard.alpha = 0;
			game.zoomForTweens = 0.35;

		case 2452:
			camHUD.flash();
			camGame.alpha = 0;
			createTween(camHUD, {alpha: 0}, 6);
	}
}
