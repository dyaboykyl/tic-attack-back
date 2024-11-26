import { Application, Sprite } from "pixi.js";

declare global {
  var __PIXI_APP__: Application; //eslint-disable-line no-var
}

export interface FishSprite extends Sprite {
  direction: number;
  speed: number;
  turnSpeed: number;
}

export {};
