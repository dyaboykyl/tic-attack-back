import "pixi-spine";
import { Application, Assets, Container, Sprite, Texture, Ticker, TilingSprite } from "pixi.js";
import "./style.css";
import { FishSprite } from "./typings";

declare const VERSION: string;

// const gameWidth = 1280;
// const gameHeight = 720;

console.log(
  `%cPixiJS V7\nTypescript Boilerplate%c ${VERSION} %chttp://www.pixijs.com %c❤️`,
  "background: #ff66a1; color: #FFFFFF; padding: 2px 4px; border-radius: 2px; font-weight: bold;",
  "color: #D81B60; font-weight: bold;",
  "color: #C2185B; font-weight: bold; text-decoration: underline;",
  "color: #ff66a1;",
);

const app = new Application();
globalThis.__PIXI_APP__ = app;

// Store an array of fish sprites for animation.
const fishes: FishSprite[] = [];
let overlay: TilingSprite;

// Asynchronous IIFE
(async () => {
  await setup();
  await preload();
  addBackground(app);
  addFishes(app, fishes);
  addWaterOverlay(app);

  // Add the fish animation callback to the application's ticker.
  app.ticker.add((time) => {
    animateFishes(app, fishes);
    animateWaterOverlay(app, time);
  });
})();

async function setup() {
  await app.init({ background: "#1099bb", resizeTo: window });
  document.body.appendChild(app.canvas);
  app.stage.interactive = true;

  if (VERSION.includes("d")) {
    // if development version
    // attachConsole(app.stage, gameWidth, gameHeight);
  }
}

async function preload() {
  await loadGameAssets();
  // resizeCanvas();

  // const birdFromSprite = createBird();
  // birdFromSprite.anchor.set(0.5, 0.5);
  // birdFromSprite.position.set(gameWidth / 2, gameHeight / 4);

  // const spineExample = await getSpine();

  // app.stage.addChild(birdFromSprite);
  // app.stage.addChild(spineExample);
}

async function loadGameAssets(): Promise<void> {
  const assets = [
    { alias: "background", src: "https://pixijs.com/assets/tutorials/fish-pond/pond_background.jpg" },
    { alias: "fish1", src: "https://pixijs.com/assets/tutorials/fish-pond/fish1.png" },
    { alias: "fish2", src: "https://pixijs.com/assets/tutorials/fish-pond/fish2.png" },
    { alias: "fish3", src: "https://pixijs.com/assets/tutorials/fish-pond/fish3.png" },
    { alias: "fish4", src: "https://pixijs.com/assets/tutorials/fish-pond/fish4.png" },
    { alias: "fish5", src: "https://pixijs.com/assets/tutorials/fish-pond/fish5.png" },
    { alias: "overlay", src: "https://pixijs.com/assets/tutorials/fish-pond/wave_overlay.png" },
    { alias: "displacement", src: "https://pixijs.com/assets/tutorials/fish-pond/displacement_map.png" },
  ];
  await Assets.load(assets);
}

export function addBackground(app: Application) {
  const background = Sprite.from("background");
  background.anchor.set(0.5);

  if (app.screen.width > app.screen.height) {
    background.width = app.screen.width * 1.2;
    background.scale.y = background.scale.x;
  } else {
    background.height = app.screen.height * 1.2;
    background.scale.x = background.scale.y;
  }
  background.x = app.screen.width / 2;
  background.y = app.screen.height / 2;

  app.stage.addChild(background);
}

export function addFishes(app: Application, fishes: FishSprite[]) {
  const fishContainer = new Container();
  app.stage.addChild(fishContainer);
  const fishCount = 20;
  const fishAssets = ["fish1", "fish2", "fish3", "fish4", "fish5"];

  for (let i = 0; i < fishCount; i++) {
    const fishAsset = fishAssets[i % fishAssets.length];
    const fish = Sprite.from(fishAsset) as FishSprite;

    fish.anchor.set(0.5);

    fish.direction = Math.random() * Math.PI * 2;
    fish.speed = 2 + Math.random() * 2;
    fish.turnSpeed = Math.random() - 0.8;

    fish.x = Math.random() * app.screen.width;
    fish.y = Math.random() * app.screen.height;
    fish.scale.set(0.5 + Math.random() * 0.2);

    fishContainer.addChild(fish);
    fishes.push(fish);
  }
}

export function animateFishes(app: Application, fishes: FishSprite[]) {
  const stagePadding = 100;
  const boundWidth = app.screen.width + stagePadding * 2;
  const boundHeight = app.screen.height + stagePadding * 2;
  fishes.forEach((fish) => {
    fish.direction += fish.turnSpeed * 0.01;
    fish.x += Math.sin(fish.direction) * fish.speed;
    fish.y += Math.cos(fish.direction) * fish.speed;
    fish.rotation = -fish.direction - Math.PI / 2;

    if (fish.x < -stagePadding) {
      fish.x += boundWidth;
    }
    if (fish.x > app.screen.width + stagePadding) {
      fish.x -= boundWidth;
    }
    if (fish.y < -stagePadding) {
      fish.y += boundHeight;
    }
    if (fish.y > app.screen.height + stagePadding) {
      fish.y -= boundHeight;
    }
  });
}

export function addWaterOverlay(app: Application) {
  // Create a water texture object.
  const texture = Texture.from("overlay");

  // Create a tiling sprite with the water texture and specify the dimensions.
  overlay = new TilingSprite({
    texture,
    width: app.screen.width,
    height: app.screen.height,
  });

  // Add the overlay to the stage.
  app.stage.addChild(overlay);
}

export function animateWaterOverlay(app: Application, time: Ticker) {
  // Extract the delta time from the Ticker object.
  const delta = time.deltaTime;

  // Animate the overlay.
  overlay.tilePosition.x -= delta;
  overlay.tilePosition.y -= delta;
}

// function resizeCanvas(): void {
//     const resize = () => {
//         app.renderer.resize(window.innerWidth, window.innerHeight);
//         app.stage.scale.x = window.innerWidth / gameWidth;
//         app.stage.scale.y = window.innerHeight / gameHeight;
//     };

//     resize();

//     window.addEventListener("resize", resize);
// }
