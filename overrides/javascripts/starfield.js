/*
 * starfield.js
 *
 * Version: 1.5.0
 * Description: Interactive starfield background
 *
 * Usage:
 *  Starfield.setup({
 *    // options
 *  });
 */
(function (root, factory) {
  if (typeof define === "function" && define.amd) {
    define([], factory);
  } else if (typeof module === "object" && module.exports) {
    module.exports = factory();
  } else {
    root.Starfield = factory();
  }
})(this, function () {
  const Starfield = {};

  const config = {
    numStars: 250, // Number of stars
    baseSpeed: 1, // Base speed of stars (will affect acceleration)
    trailLength: 0.8, // Length of star trail (0-1)
    starColor: "rgb(255, 255, 255)", // Color of stars (only rgb)
    canvasColor: "rgb(0, 0, 0)", // Canvas background color (only rgb)
    hueJitter: 0, // Maximum hue variation in degrees (0-360)
    maxAcceleration: 10, // Maximum acceleration
    accelerationRate: 0.2, // Rate of acceleration
    decelerationRate: 0.2, // Rate of deceleration
    minSpawnRadius: 80, // Minimum spawn distance from origin
    maxSpawnRadius: 500, // Maximum spawn distance from origin
    auto: true,
    originX: null,
    originY: null,
    container: null,
    originElement: null,
  };

  let stars = [];
  let accelerate = false;
  let accelerationFactor = 0;
  let originX = 0;
  let originY = 0;
  let prevOriginX = 0;
  let prevOriginY = 0;

  let canvas, ctx;
  let width, height;
  let lastTimestamp = 0;
  let canvasRGB = [0, 0, 0];
  let lastCanvasColor = config.canvasColor;

  let origin;
  let container;

  const mouseEnterHandler = () => (accelerate = true);
  const mouseLeaveHandler = () => (accelerate = false);
  const resizeHandler = () => windowResized(container, origin);

  function visibilityHandler() {
    if (document.visibilityState === "visible") {
      lastTimestamp = performance.now();
    }
  }

  function getOriginY(origin, container) {
    const originRect = origin.getBoundingClientRect();
    const containerRect = container.getBoundingClientRect();
    return originRect.top - containerRect.top + originRect.height / 2;
  }

  function getOriginX(origin, container) {
    const originRect = origin.getBoundingClientRect();
    const containerRect = container.getBoundingClientRect();
    return originRect.left - containerRect.left + originRect.width / 2;
  }

  /**
   * Set up and start the starfield animation.
   * @param {Object} userConfig Configuration options.
   */
  function setup(userConfig = {}) {
    Object.assign(config, userConfig);

    container = config.container || document.querySelector(".starfield");
    if (!container) {
      throw new Error("Starfield: No container element found.");
    }
    // container.style.position = "relative";

    width = container.clientWidth;
    height = container.clientHeight;

    canvas = document.createElement("canvas");
    canvas.width = width;
    canvas.height = height;

    canvas.style.position = "absolute";
    canvas.style.top = "0";
    canvas.style.left = "0";
    canvas.style.width = "100%";
    canvas.style.height = "100%";
    canvas.style.zIndex = "-1";
    canvasRGB = parseRGBA(config.canvasColor);

    container.appendChild(canvas);

    ctx = canvas.getContext("2d");

    if (config.auto) {
      origin =
        config.originElement || document.querySelector(".starfield-origin");
      if (!origin) {
        throw new Error("Starfield: No origin element found.");
      }
      originX = getOriginX(origin, container);
      originY = getOriginY(origin, container);

      origin.addEventListener("mouseenter", mouseEnterHandler);
      origin.addEventListener("mouseleave", mouseLeaveHandler);

      window.addEventListener("resize", resizeHandler);
    } else {
      originX = config.originX !== null ? config.originX : width / 2;
      originY = config.originY !== null ? config.originY : height / 2;
    }

    for (let i = 0; i < config.numStars; i++) {
      const star = createRandomStar();
      stars.push(star);
    }

    document.addEventListener("visibilitychange", visibilityHandler);

    requestAnimationFrame(draw);
  }

  function windowResized(container, origin) {
    width = container.clientWidth;
    height = container.clientHeight;
    canvas.width = width;
    canvas.height = height;

    originX = getOriginX(origin, container);
    originY = getOriginY(origin, container);

    stars.forEach((star) => star.reset());
  }

  function createRandomStar() {
    const angle = random(0, Math.PI * 2);
    const radius = random(config.minSpawnRadius, config.maxSpawnRadius);

    const x = originX + Math.cos(angle) * radius;
    const y = originY + Math.sin(angle) * radius;

    return new Star(x, y);
  }

  class Star {
    constructor(x, y) {
      this.pos = {
        x: x,
        y: y,
      };
      this.prevpos = {
        x: x,
        y: y,
      };
      this.vel = {
        x: 0,
        y: 0,
      };
      this.angle = Math.atan2(y - originY, x - originX);
      this.baseSpeed = random(config.baseSpeed * 0.5, config.baseSpeed * 1.5);
      this.hueOffset = random(-config.hueJitter, config.hueJitter);
    }

    reset() {
      const newStar = createRandomStar();
      this.pos.x = newStar.pos.x;
      this.pos.y = newStar.pos.y;
      this.prevpos.x = this.pos.x;
      this.prevpos.y = this.pos.y;
      this.vel.x = 0;
      this.vel.y = 0;
      this.angle = Math.atan2(this.pos.y - originY, this.pos.x - originX);
      this.baseSpeed = random(config.baseSpeed * 0.5, config.baseSpeed * 1.5);
      this.hueOffset = random(-config.hueJitter, config.hueJitter);
    }

    update(acc, deltaTime) {
      const adjustedAcc = acc * this.baseSpeed;

      this.vel.x += Math.cos(this.angle) * adjustedAcc * deltaTime;
      this.vel.y += Math.sin(this.angle) * adjustedAcc * deltaTime;

      this.prevpos.x = this.pos.x;
      this.prevpos.y = this.pos.y;
      this.pos.x += this.vel.x * deltaTime;
      this.pos.y += this.vel.y * deltaTime;
    }

    draw() {
      let velMag = Math.sqrt(
        this.vel.x * this.vel.x + this.vel.y * this.vel.y
      );
      velMag = velMag * 3;
      const alpha = map(velMag, 0, 10, 0, 1);
      const weight = map(velMag, 0, 10, 1, 3);

      ctx.lineWidth = weight;

      const [r, g, b] = parseRGBA(config.starColor);
      const [h, s, l] = rgbToHsl(r, g, b);
      const adjustedH = (h + this.hueOffset + 360) % 360;
      const [newR, newG, newB] = hslToRgb(adjustedH, s, l).map((v) =>
        Math.round(v)
      );
      ctx.strokeStyle = `rgba(${newR}, ${newG}, ${newB}, ${alpha})`;

      ctx.beginPath();
      ctx.moveTo(this.prevpos.x, this.prevpos.y);
      ctx.lineTo(this.pos.x, this.pos.y);
      ctx.stroke();
    }

    isActive() {
      return onScreen(this.pos.x, this.pos.y);
    }

    updateAngle() {
      this.angle = Math.atan2(this.pos.y - originY, this.pos.x - originX);
    }
  }

  function draw(timestamp) {
    if (!lastTimestamp) lastTimestamp = timestamp;
    const deltaTime = (timestamp - lastTimestamp) / 16.67;
    lastTimestamp = timestamp;

    if (config.auto) {
      originX = getOriginX(origin, container);
      originY = getOriginY(origin, container);
      if (originX !== prevOriginX || originY !== prevOriginY) {
        stars.forEach((star) => {
          star.updateAngle();
        });
        prevOriginX = originX;
        prevOriginY = originY;
      }
    }

    if (lastCanvasColor !== config.canvasColor) {
      canvasRGB = parseRGBA(config.canvasColor);
      lastCanvasColor = config.canvasColor;
    }
    const [bgR, bgG, bgB] = canvasRGB;
    ctx.fillStyle = `rgba(${bgR}, ${bgG}, ${bgB}, ${1 - config.trailLength})`;
    ctx.fillRect(0, 0, width, height);

    if (accelerate) {
      accelerationFactor = Math.min(
        accelerationFactor + config.accelerationRate * deltaTime,
        config.maxAcceleration
      );
    } else {
      accelerationFactor = Math.max(
        accelerationFactor - config.decelerationRate * deltaTime,
        0
      );
    }

    const baseAcc = 0.01;
    const currentAcc = baseAcc * (1 + accelerationFactor * 10);

    for (let star of stars) {
      star.update(currentAcc, deltaTime);
      star.draw();
      if (!star.isActive()) {
        star.reset();
      }
    }

    requestAnimationFrame(draw);
  }

  function onScreen(x, y) {
    return x >= 0 && x <= width && y >= 0 && y <= height;
  }

  function random(min, max) {
    return Math.random() * (max - min) + min;
  }

  // https://gist.github.com/mjackson/5311256
  function rgbToHsl(r, g, b) {
    r /= 255;
    g /= 255;
    b /= 255;
    const max = Math.max(r, g, b),
      min = Math.min(r, g, b);
    let h,
      s,
      l = (max + min) / 2;

    if (max === min) {
      h = s = 0;
    } else {
      const d = max - min;
      s = l > 0.5 ? d / (2 - max - min) : d / (max + min);
      switch (max) {
        case r:
          h = (g - b) / d + (g < b ? 6 : 0);
          break;
        case g:
          h = (b - r) / d + 2;
          break;
        case b:
          h = (r - g) / d + 4;
          break;
      }
      h /= 6;
    }

    return [h * 360, s, l];
  }

  // https://gist.github.com/mjackson/5311256
  function hslToRgb(h, s, l) {
    let r, g, b;
    h = h / 360;

    if (s === 0) {
      r = g = b = l;
    } else {
      const hue2rgb = (p, q, t) => {
        if (t < 0) t += 1;
        if (t > 1) t -= 1;
        if (t < 1 / 6) return p + (q - p) * 6 * t;
        if (t < 1 / 2) return q;
        if (t < 2 / 3) return p + (q - p) * (2 / 3 - t) * 6;
        return p;
      };

      const q = l < 0.5 ? l * (1 + s) : l + s - l * s;
      const p = 2 * l - q;
      r = hue2rgb(p, q, h + 1 / 3);
      g = hue2rgb(p, q, h);
      b = hue2rgb(p, q, h - 1 / 3);
    }

    return [r * 255, g * 255, b * 255];
  }

  function parseRGBA(color) {
    const rgbaRegex = /rgba?\((\d+),\s*(\d+),\s*(\d+)/;
    const match = color.match(rgbaRegex);
    if (match) {
      return [
        parseInt(match[1], 10),
        parseInt(match[2], 10),
        parseInt(match[3], 10),
      ];
    }
    return [255, 255, 255];
  }

  function map(value, start1, stop1, start2, stop2) {
    return ((value - start1) / (stop1 - start1)) * (stop2 - start2) + start2;
  }

  /**
   * Set the acceleration state of the starfield.
   * @param {boolean} state The acceleration state.
   */
  function setAccelerate(state) {
    accelerate = state;
  }

  /**
   * Set the x-coordinate of the origin of the starfield.
   * @param {number} x The x-coordinate of the origin.
   */
  function setOriginX(x) {
    originX = x;
    stars.forEach((star) => {
      star.angle = Math.atan2(star.pos.y - originY, star.pos.x - originX);
    });
  }

  /**
   * Set the y-coordinate of the origin of the starfield.
   * @param {number} y The y-coordinate of the origin.
   */
  function setOriginY(y) {
    originY = y;
    stars.forEach((star) => {
      star.angle = Math.atan2(star.pos.y - originY, star.pos.x - originX);
    });
  }

  /**
   * Set the origin of the starfield to a specific point.
   * @param {number} x The x-coordinate of the origin.
   * @param {number} y The y-coordinate of the origin.
   */
  function setOrigin(x, y) {
    originX = x;
    originY = y;
    stars.forEach((star) => {
      star.angle = Math.atan2(star.pos.y - originY, star.pos.x - originX);
    });
  }

  /**
   * Resize the starfield to a new width and height.
   * @param {number} newWidth The new width of the starfield.
   * @param {number} newHeight The new height of the starfield.
   */
  function resize(newWidth, newHeight) {
    width = newWidth;
    height = newHeight;
    canvas.width = width;
    canvas.height = height;

    if (config.originY !== null) {
      originY = config.originY;
    } else {
      originY = height / 2;
    }

    stars.forEach((star) => star.reset());
  }

  function cleanup() {
    if (origin) {
      origin.removeEventListener("mouseenter", mouseEnterHandler);
      origin.removeEventListener("mouseleave", mouseLeaveHandler);
    }
    window.removeEventListener("resize", resizeHandler);
    document.removeEventListener("visibilitychange", visibilityHandler);

    if (canvas && canvas.parentNode) {
      canvas.parentNode.removeChild(canvas);
    }

    stars = [];
    accelerate = false;
    accelerationFactor = 0;
    originX = 0;
    originY = 0;
    prevOriginX = 0;
    prevOriginY = 0;
    lastTimestamp = 0;
  }

  Starfield.setup = setup;
  Starfield.setAccelerate = setAccelerate;
  Starfield.setOrigin = setOrigin;
  Starfield.setOriginX = setOriginX;
  Starfield.setOriginY = setOriginY;
  Starfield.resize = resize;
  Starfield.config = config;
  Starfield.cleanup = cleanup;

  return Starfield;
});
