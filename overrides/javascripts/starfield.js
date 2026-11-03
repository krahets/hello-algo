/* Homepage illustration motion. Loaded only by the landing-page build hook. */
(function (root) {
  "use strict";

  let dispose = () => {};
  const restoreImage = image => {
    if (image?.dataset.heroFallback && !image.getAttribute('src')) image.src = image.dataset.heroFallback;
  };
  const moduleBase = new URL(".", document.currentScript.src);

  function setup(config = {}) {
    dispose();
    const container = config.container || document.querySelector(".starfield");
    const hero = container?.closest(".home-div");
    const map = hero?.querySelector(".hero-div");
    if (!map) return;
    // Below-fold preloading waits for the enhancement (or its static fallback).
    let settleReady;
    hero.homeReady = new Promise(resolve => { settleReady = resolve; });

    const reduced = matchMedia("(prefers-reduced-motion: reduce)");
    const finePointer = matchMedia("(hover: hover) and (pointer: fine)");
    const listeners = [];
    const on = (target, type, fn) => {
      target.addEventListener(type, fn);
      listeners.push(() => target.removeEventListener(type, fn));
    };
    const items = Array.from(map.querySelectorAll(":scope > a")).map((anchor, i) => ({
      anchor,
      image: anchor.querySelector("img"),
      label: anchor.querySelector("span"),
      originalLabelMargin: anchor.querySelector("span")?.style.marginLeft || "",
      depth: 0.55 + (i % 4) * 0.15,
      phase: i * 2.39996,
      speed: 0.55 + (i % 5) * 0.055,
      astronaut: anchor.querySelector('img[data-hero-asset="astronaut"]') !== null,
      x: 0,
      y: 0,
      angle: 0,
    })).filter(item => item.image);
    const ground = map.querySelector(':scope > img[data-hero-asset="ground"]');
    const links = map.querySelector(':scope > img[data-hero-asset="links"]');
    ground?.classList.add("hero-ground");
    links?.classList.add("hero-links");
    hero.classList.add("hero-universe");

    const canvas = document.createElement("canvas");
    canvas.className = "hero-stars";
    canvas.setAttribute("aria-hidden", "true");
    container.appendChild(canvas);
    // Illustration interactions also work if Canvas is unavailable.
    let ctx = null;
    try { ctx = canvas.getContext("2d"); } catch (_) { /* Static background remains. */ }

    const lang = (document.documentElement.lang || "zh").toLowerCase();
    const labels = lang.startsWith("en") ? ["Pause animation", "Play animation"]
      : lang.startsWith("ja") ? ["アニメーションを一時停止", "アニメーションを再生"]
      : lang.startsWith("ko") ? ["애니메이션 일시 정지", "애니메이션 재생"]
      : lang.startsWith("ru") ? ["Приостановить анимацию", "Воспроизвести анимацию"]
      : /hant|tw/.test(lang) ? ["暫停動畫", "播放動畫"] : ["暂停动画", "播放动画"];
    const toggle = document.createElement("button");
    toggle.type = "button";
    toggle.className = "hero-motion-toggle";
    toggle.innerHTML = '<svg viewBox="0 0 24 24" aria-hidden="true"><path class="hero-pause-icon" d="M8 6v12M16 6v12"/><path class="hero-play-icon" d="m9 6 9 6-9 6Z"/></svg>';
    hero.appendChild(toggle);

    let width = 1, height = 1, scale = 1, stars = [];
    let pointer = { x: 0, y: 0 }, target = { x: 0, y: 0 };
    let hovered = null, focused = null;
    let visible = false, suspended = false, destroyed = false;
    let raf = 0, last = 0, time = 0, paused = false;
    let planets = null, hourglass = null, objectsRequested = false;
    try { paused = sessionStorage.getItem("hello-algo:hero-paused") === "true"; } catch (_) { /* Storage is optional. */ }

    const staticMotion = () => reduced.matches || paused;
    const canRun = () => !destroyed && visible && !suspended && !document.hidden && !staticMotion();
    const wrap = (n, size) => ((n % size) + size) % size;

    function renderObjects() {
      const enabled = !reduced.matches;
      if (!enabled) items.forEach(item => restoreImage(item.image));
      if (planets) {
        try { planets.render(time, enabled, pointer); }
        catch (error) {
          planets.dispose();
          planets = null;
          items.filter(item => item.image.dataset.heroAsset !== 'chapter_computational_complexity').forEach(item => restoreImage(item.image));
          console.warn("Planet rendering unavailable; keeping the original illustrations.", error);
        }
      }
      hourglass?.render(time, enabled);
    }

    function loadObjects() {
      if (objectsRequested || destroyed || !visible || reduced.matches) return;
      objectsRequested = true;
      const planetReady = import(new URL("hero-planets.js", moduleBase).href).then(module => {
        if (destroyed) return;
        planets = module.createPlanets(map, items, updatePlayback, restoreImage);
        renderObjects();
        resize();
        return planets.ready;
      }).catch(error => {
        items.filter(item => item.image.dataset.heroAsset !== 'chapter_computational_complexity').forEach(item => restoreImage(item.image));
        console.warn("3D enhancement unavailable; loading fallback planets.", error);
      });
      const hourglassReady = import(new URL("hero-hourglass.js", moduleBase).href).then(module => {
        if (destroyed) return;
        hourglass = module.createHourglass(items);
        renderObjects();
      }).catch(error => {
        restoreImage(items.find(item => item.image.dataset.heroAsset === 'chapter_computational_complexity')?.image);
        console.warn("Hourglass enhancement unavailable; loading fallback illustration.", error);
      });
      Promise.allSettled([planetReady, hourglassReady]).then(settleReady);
    }

    function drawStars() {
      if (!ctx) return;
      ctx.clearRect(0, 0, width, height);
      for (const star of stars) {
        const drift = time * star.depth * 0.7;
        const x = wrap(star.x * width + drift + pointer.x * star.depth * 10, width + 16) - 8;
        const y = wrap(star.y * height + Math.sin(time * 0.08 + star.phase) * 2 + pointer.y * star.depth * 7, height + 16) - 8;
        const twinkle = 0.78 + Math.sin(time * star.speed + star.phase) * 0.22;
        ctx.globalAlpha = star.opacity * twinkle;
        ctx.fillStyle = star.color;
        ctx.beginPath();
        ctx.arc(x, y, star.radius, 0, Math.PI * 2);
        ctx.fill();
        if (star.radius > 1.2) {
          ctx.globalAlpha *= 0.12;
          ctx.beginPath();
          ctx.arc(x, y, star.radius * 3, 0, Math.PI * 2);
          ctx.fill();
        }
      }
      ctx.globalAlpha = 1;
    }

    function moveIllustrations(dt) {
      const mix = 1 - Math.exp(-dt * 5);
      pointer.x += (target.x - pointer.x) * mix;
      pointer.y += (target.y - pointer.y) * mix;
      const still = staticMotion();
      const central = item => item.astronaut || item.image.dataset.heroAsset === 'chapter_computational_complexity';
      const centralSelected = items.some(item => central(item) && (item.anchor === hovered || item.anchor === focused));
      for (const item of items) {
        if (central(item)) {
          if (!still && centralSelected) continue;
          item.x = still ? 0 : pointer.x * 2 * scale;
          item.y = still ? 0 : (pointer.y * 1.5 - Math.sin(time * .45) * 1.2) * scale;
          item.angle = 0;
          item.anchor.style.setProperty('--hero-x', `${item.x.toFixed(2)}px`);
          item.anchor.style.setProperty('--hero-y', `${item.y.toFixed(2)}px`);
          item.anchor.style.setProperty('--hero-angle', '0deg');
          continue;
        }
        // Freeze the selected object so the pointer/keyboard target stays easy to use.
        if (!still && (item.anchor === hovered || item.anchor === focused)) continue;
        const amplitude = (item.astronaut ? 5 : 2.6) * scale;
        const x = (pointer.x * 7 * item.depth + Math.sin(time * item.speed * 0.7 + item.phase) * 1.4) * scale;
        const y = pointer.y * 5 * item.depth * scale + Math.sin(time * item.speed + item.phase) * amplitude;
        const angle = Math.sin(time * item.speed * 0.65 + item.phase) * (item.astronaut ? 0.65 : 0.35);
        item.x = still ? 0 : item.x + (x - item.x) * mix;
        item.y = still ? 0 : item.y + (y - item.y) * mix;
        item.angle = still ? 0 : item.angle + (angle - item.angle) * mix;
        item.anchor.style.setProperty("--hero-x", `${item.x.toFixed(2)}px`);
        item.anchor.style.setProperty("--hero-y", `${item.y.toFixed(2)}px`);
        item.anchor.style.setProperty("--hero-angle", `${item.angle.toFixed(3)}deg`);
      }
      map.style.setProperty("--hero-ground-x", `${(still ? 0 : pointer.x * 2 * scale).toFixed(2)}px`);
      map.style.setProperty("--hero-ground-y", `${(still ? 0 : pointer.y * 1.5 * scale).toFixed(2)}px`);
    }

    function frame(now) {
      raf = 0;
      if (!hero.isConnected) { dispose(); return; }
      // A media preference may change before its queued change event is delivered.
      // Apply its static state before this frame stops scheduling the next one.
      if (reduced.matches && !hero.classList.contains('hero-motion-paused')) {
        updatePlayback();
        return;
      }
      if (!canRun()) return;
      // Cap touch devices at 30 fps. Motion uses elapsed time, not frame count.
      if (last && now - last < (finePointer.matches ? 14 : 30)) {
        raf = requestAnimationFrame(frame);
        return;
      }
      const dt = last ? Math.min((now - last) / 1000, 0.05) : 0;
      last = now;
      time += dt;
      moveIllustrations(dt);
      drawStars();
      renderObjects();
      raf = requestAnimationFrame(frame);
    }

    function updatePlayback() {
      cancelAnimationFrame(raf);
      raf = 0;
      last = 0;
      toggle.hidden = reduced.matches;
      toggle.setAttribute("aria-label", labels[paused ? 1 : 0]);
      toggle.title = labels[paused ? 1 : 0];
      toggle.dataset.paused = String(paused);
      hero.classList.toggle("hero-motion-paused", staticMotion());
      if (reduced.matches) {
        pointer = { x: 0, y: 0 };
        target = { x: 0, y: 0 };
        moveIllustrations(0);
      }
      drawStars();
      renderObjects();
      loadObjects();
      if (canRun()) raf = requestAnimationFrame(frame);
    }

    function resize() {
      width = Math.max(container.clientWidth, 1);
      height = Math.max(container.clientHeight, 1);
      scale = Math.min(1, map.clientWidth / 1000);
      const dpr = Math.min(window.devicePixelRatio || 1, finePointer.matches ? 1.5 : 1);
      canvas.width = Math.round(width * dpr);
      canvas.height = Math.round(height * dpr);
      ctx?.setTransform(dpr, 0, 0, dpr, 0, 0);
      // Deterministic positions avoid a new constellation on every resize.
      let seed = 73;
      const random = () => { seed = (seed * 1664525 + 1013904223) >>> 0; return seed / 4294967296; };
      const count = Math.min(finePointer.matches ? 300 : 130, Math.max(65, Math.round(width * height / 4200)));
      stars = Array.from({ length: count }, (_, i) => ({
        x: random(), y: random(), phase: random() * Math.PI * 2,
        depth: [0.25, 0.6, 1][i % 3],
        radius: (0.4 + random() * 0.55) * [0.7, 1, 1.5][i % 3],
        opacity: 0.2 + random() * 0.45,
        speed: 0.35 + random() * 0.45,
        color: ["#d0dedc", "#c5d2e8", "#e3d5bf"][i % 3],
      }));
      if (!paused || reduced.matches) moveIllustrations(0);
      drawStars();
      planets?.resize();
      renderObjects();
      // A page can have no horizontal scroll while absolutely positioned text is clipped.
      // Leave room for the small pointer displacement on both sides of the actual viewport.
      const heroBounds = hero.getBoundingClientRect();
      const left = Math.max(0, heroBounds.left) + 12;
      const right = Math.min(document.documentElement.clientWidth, heroBounds.right) - 12;
      for (const item of items) {
        if (!item.label) continue;
        item.label.style.marginLeft = item.originalLabelMargin;
        const bounds = item.label.getBoundingClientRect();
        const nudge = Math.max(left - bounds.left, Math.min(0, right - bounds.right));
        const base = parseFloat(getComputedStyle(item.label).marginLeft) || 0;
        if (Math.abs(nudge) > .1) item.label.style.marginLeft = `${base + nudge}px`;
      }
      loadObjects();
    }

    function updateSelection() {
      const selected = focused || hovered;
      for (const item of items) item.anchor.classList.toggle("hero-selected", item.anchor === selected);
      map.classList.toggle("hero-network-active", Boolean(selected));
      if (!canRun()) renderObjects();
    }

    on(hero, "pointermove", event => {
      if (!finePointer.matches || event.pointerType === "touch" || staticMotion()) return;
      const bounds = hero.getBoundingClientRect();
      target.x = Math.max(-1, Math.min(1, (event.clientX - bounds.left) / bounds.width * 2 - 1));
      target.y = Math.max(-1, Math.min(1, (event.clientY - bounds.top) / bounds.height * 2 - 1));
    });
    on(hero, "pointerleave", () => { target = { x: 0, y: 0 }; hovered = null; updateSelection(); });
    for (const item of items) {
      on(item.anchor, "pointerenter", event => {
        if (event.pointerType === "touch" || !finePointer.matches) return;
        hovered = item.anchor;
        updateSelection();
      });
      on(item.anchor, "pointerleave", () => { if (hovered === item.anchor) hovered = null; updateSelection(); });
      on(item.anchor, "focus", () => { focused = item.anchor; updateSelection(); });
      on(item.anchor, "blur", () => { focused = null; updateSelection(); });
    }
    on(toggle, "click", () => {
      paused = !paused;
      try { sessionStorage.setItem("hello-algo:hero-paused", String(paused)); } catch (_) { /* Storage is optional. */ }
      updatePlayback();
    });
    on(reduced, "change", updatePlayback);
    on(finePointer, "change", () => { target = { x: 0, y: 0 }; resize(); });
    on(document, "visibilitychange", updatePlayback);
    on(window, "pagehide", () => { suspended = true; updatePlayback(); });
    on(window, "pageshow", () => { suspended = false; updatePlayback(); });

    const resizeObserver = new ResizeObserver(resize);
    resizeObserver.observe(hero);
    resizeObserver.observe(map);
    const intersectionObserver = new IntersectionObserver(entries => {
      visible = entries[0].isIntersecting;
      updatePlayback();
      if (!objectsRequested && (!visible || reduced.matches)) settleReady();
    });
    intersectionObserver.observe(hero);

    dispose = () => {
      destroyed = true;
      settleReady();
      cancelAnimationFrame(raf);
      resizeObserver.disconnect();
      intersectionObserver.disconnect();
      listeners.forEach(remove => remove());
      planets?.dispose();
      hourglass?.dispose();
      canvas.remove();
      toggle.remove();
      hero.classList.remove("hero-universe", "hero-motion-paused");
      map.classList.remove("hero-network-active");
      map.style.removeProperty("--hero-ground-x");
      map.style.removeProperty("--hero-ground-y");
      ground?.classList.remove("hero-ground");
      links?.classList.remove("hero-links");
      for (const { anchor, label, originalLabelMargin } of items) {
        if (label) label.style.marginLeft = originalLabelMargin;
        anchor.classList.remove("hero-selected");
        ["--hero-x", "--hero-y", "--hero-angle"].forEach(name => anchor.style.removeProperty(name));
      }
    };
    resize();
    updatePlayback();
  }

  // Retain the build hook's entry point; all motion shares one cancellable loop.
  root.Starfield = { setup: config => {
    try { setup(config); }
    catch (error) {
      dispose();
      document.querySelectorAll('[data-hero-fallback]').forEach(restoreImage);
      console.warn('Scene unavailable; loading fallback illustrations.', error);
    }
  }, cleanup: () => dispose() };
})(window);
