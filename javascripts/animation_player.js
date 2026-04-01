(() => {
  const ANIMATION_LABEL_PATTERN = /^<\d+>$/;
  const AUTO_SLIDE_INITIAL_DELAY_MS = 1000;
  const AUTO_SLIDE_INTERVAL_MS = 1500;
  const PLAY_LABEL = "播放幻灯片";
  const PAUSE_LABEL = "暂停幻灯片";
  const SVG_NS = "http://www.w3.org/2000/svg";
  const FA_PLAY_PATH =
    "M91.2 36.9c-12.4-6.8-27.4-6.5-39.6.7S32 57.9 32 72v368c0 14.1 7.5 27.2 19.6 34.4s27.2 7.5 39.6.7l336-184c12.8-7 20.8-20.5 20.8-35.1s-8-28.1-20.8-35.1z";
  const FA_PAUSE_PATH =
    "M48 32C21.5 32 0 53.5 0 80v352c0 26.5 21.5 48 48 48h64c26.5 0 48-21.5 48-48V80c0-26.5-21.5-48-48-48zm224 0c-26.5 0-48 21.5-48 48v352c0 26.5 21.5 48 48 48h64c26.5 0 48-21.5 48-48V80c0-26.5-21.5-48-48-48z";
  const FA_ARROW_LEFT_PATH =
    "M9.4 233.4c-12.5 12.5-12.5 32.8 0 45.3l160 160c12.5 12.5 32.8 12.5 45.3 0s12.5-32.8 0-45.3L109.3 288H480c17.7 0 32-14.3 32-32s-14.3-32-32-32H109.3l105.4-105.4c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0l-160 160z";
  const FA_ARROW_RIGHT_PATH =
    "M502.6 278.6c12.5-12.5 12.5-32.8 0-45.3l-160-160c-12.5-12.5-32.8-12.5-45.3 0s-12.5 32.8 0 45.3L402.7 224H32c-17.7 0-32 14.3-32 32s14.3 32 32 32h370.7L297.3 393.4c-12.5 12.5-12.5 32.8 0 45.3s32.8 12.5 45.3 0l160-160z";
  const initializedSets = new WeakSet();
  const controllers = new Set();

  const getCheckedIndex = (inputs) => {
    const checkedIndex = inputs.findIndex((input) => input.checked);
    return checkedIndex === -1 ? 0 : checkedIndex;
  };

  const setCheckedIndex = (inputs, index) => {
    const normalizedIndex = ((index % inputs.length) + inputs.length) % inputs.length;
    inputs[normalizedIndex].checked = true;
    return normalizedIndex;
  };

  const isAnimationSet = (tabbedSet) => {
    const labels = Array.from(tabbedSet.querySelectorAll(":scope > .tabbed-labels > label"));
    if (labels.length < 2) {
      return false;
    }
    return labels.every((label) => ANIMATION_LABEL_PATTERN.test(label.textContent.trim()));
  };

  const createSvgIcon = ({ className, path, viewBox, width, height }) => {
    const icon = document.createElementNS(SVG_NS, "svg");
    const iconPath = document.createElementNS(SVG_NS, "path");

    icon.setAttribute("class", className);
    icon.setAttribute("aria-hidden", "true");
    icon.setAttribute("viewBox", viewBox);
    icon.setAttribute("focusable", "false");
    if (width) {
      icon.setAttribute("width", width);
    }
    if (height) {
      icon.setAttribute("height", height);
    }
    iconPath.setAttribute("d", path);
    icon.append(iconPath);
    return { icon, iconPath };
  };

  const createIconButton = ({ className, ariaLabel, path }) => {
    const button = document.createElement("button");
    const { icon } = createSvgIcon({
      className: "animation-controls__nav-icon",
      path,
      viewBox: "0 0 512 512",
    });

    button.type = "button";
    button.className = `animation-controls__button ${className}`;
    button.setAttribute("aria-label", ariaLabel);
    button.append(icon);
    return button;
  };

  const createPlayButton = () => {
    const button = document.createElement("button");
    const glyph = document.createElement("span");
    const { icon, iconPath } = createSvgIcon({
      className: "animation-controls__play-icon",
      path: FA_PLAY_PATH,
      viewBox: "0 0 448 512",
      width: "12",
      height: "12",
    });
    const srOnly = document.createElement("span");

    button.type = "button";
    button.className = "animation-controls__button animation-controls__play";
    button.setAttribute("aria-label", PLAY_LABEL);

    glyph.className = "animation-controls__play-glyph";

    icon.setAttribute("preserveAspectRatio", "xMidYMid meet");
    glyph.append(icon);

    srOnly.className = "animation-controls__sr-only";
    srOnly.textContent = PLAY_LABEL;

    button.append(glyph, srOnly);
    return { button, srOnly, icon, iconPath };
  };

  const initAnimationSet = (tabbedSet) => {
    if (initializedSets.has(tabbedSet) || !isAnimationSet(tabbedSet)) {
      return;
    }

    const inputs = Array.from(tabbedSet.querySelectorAll(':scope > input[type="radio"]'));
    const tabbedContent = tabbedSet.querySelector(":scope > .tabbed-content");
    if (inputs.length < 2 || !tabbedContent) {
      return;
    }

    initializedSets.add(tabbedSet);
    tabbedSet.dataset.autoSlide = "true";

    const controls = document.createElement("div");
    controls.className = "animation-controls";

    const playControl = createPlayButton();
    const playButton = playControl.button;
    const nav = document.createElement("div");
    nav.className = "animation-controls__nav";

    const prevButton = createIconButton({
      className: "animation-controls__prev",
      ariaLabel: "上一页",
      path: FA_ARROW_LEFT_PATH,
    });
    const pageIndicator = document.createElement("span");
    pageIndicator.className = "animation-controls__page";
    pageIndicator.setAttribute("aria-live", "polite");

    const nextButton = createIconButton({
      className: "animation-controls__next",
      ariaLabel: "下一页",
      path: FA_ARROW_RIGHT_PATH,
    });

    nav.append(prevButton, pageIndicator, nextButton);
    controls.append(playButton, nav);
    tabbedContent.insertAdjacentElement("afterend", controls);

    const state = {
      inputs,
      currentIndex: getCheckedIndex(inputs),
      intervalId: null,
      timeoutId: null,
      isPlaying: false,
    };

    const updatePlayButton = () => {
      const label = state.isPlaying ? PAUSE_LABEL : PLAY_LABEL;
      playButton.setAttribute("aria-label", label);
      playButton.classList.toggle("is-playing", state.isPlaying);
      playControl.srOnly.textContent = label;
      playControl.icon.setAttribute("viewBox", state.isPlaying ? "0 0 384 512" : "0 0 448 512");
      playControl.icon.setAttribute("width", state.isPlaying ? "10" : "12");
      playControl.iconPath.setAttribute("d", state.isPlaying ? FA_PAUSE_PATH : FA_PLAY_PATH);
    };

    const updatePageIndicator = () => {
      pageIndicator.textContent = `${state.currentIndex + 1} / ${inputs.length}`;
    };

    const stop = () => {
      if (state.timeoutId !== null) {
        window.clearTimeout(state.timeoutId);
        state.timeoutId = null;
      }
      if (state.intervalId !== null) {
        window.clearInterval(state.intervalId);
        state.intervalId = null;
      }
      state.isPlaying = false;
      updatePlayButton();
    };

    const syncCurrentIndex = () => {
      state.currentIndex = getCheckedIndex(inputs);
    };

    const moveTo = (index) => {
      state.currentIndex = setCheckedIndex(inputs, index);
      updatePageIndicator();
    };

    const step = (delta) => {
      moveTo(state.currentIndex + delta);
    };

    const start = () => {
      if (state.isPlaying) {
        return;
      }
      state.isPlaying = true;
      updatePlayButton();
      state.timeoutId = window.setTimeout(() => {
        step(1);
        state.timeoutId = null;
        state.intervalId = window.setInterval(() => {
          step(1);
        }, AUTO_SLIDE_INTERVAL_MS);
      }, AUTO_SLIDE_INITIAL_DELAY_MS);
    };

    playButton.addEventListener("click", () => {
      if (state.isPlaying) {
        stop();
        return;
      }
      syncCurrentIndex();
      start();
    });

    prevButton.addEventListener("click", () => {
      syncCurrentIndex();
      step(-1);
    });

    nextButton.addEventListener("click", () => {
      syncCurrentIndex();
      step(1);
    });

    inputs.forEach((input, index) => {
      input.addEventListener("change", () => {
        if (input.checked) {
          state.currentIndex = index;
          updatePageIndicator();
        }
      });
    });

    controllers.add(stop);
    updatePlayButton();
    updatePageIndicator();
  };

  const initAutoSlide = () => {
    document.querySelectorAll(".tabbed-set").forEach(initAnimationSet);
  };

  document.addEventListener("visibilitychange", () => {
    if (!document.hidden) {
      return;
    }
    controllers.forEach((stop) => stop());
  });

  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", initAutoSlide, { once: true });
  } else {
    initAutoSlide();
  }
})();
/*! update cache: 20260401195733 */
