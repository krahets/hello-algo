(() => {
  const ANIMATION_LABEL_PATTERN = /^<\d+>$/;
  const AUTO_SLIDE_INITIAL_DELAY_MS = 1000;
  const AUTO_SLIDE_INTERVAL_MS = 1500;
  const LABELS = {
    "zh": {
      "play": "播放步骤",
      "pause": "暂停播放",
      "paused": "已暂停。",
      "position": (n, total) => `第 ${n} 步，共 ${total} 步。`,
      "previous": "上一步",
      "next": "下一步"
    },
    "zh-hant": {
      "play": "播放步驟",
      "pause": "暫停播放",
      "paused": "已暫停。",
      "position": (n, total) => `第 ${n} 步，共 ${total} 步。`,
      "previous": "上一步",
      "next": "下一步"
    },
    "en": {
      "play": "Play steps",
      "pause": "Pause playback",
      "paused": "Paused. ",
      "position": (n, total) => `Step ${n} of ${total}. `,
      "previous": "Previous step",
      "next": "Next step"
    },
    "ru": {
      "play": "Воспроизвести шаги",
      "pause": "Приостановить воспроизведение",
      "paused": "Приостановлено. ",
      "position": (n, total) => `Шаг ${n} из ${total}. `,
      "previous": "Предыдущий шаг",
      "next": "Следующий шаг"
    },
    "ja": {
      "play": "ステップを再生",
      "pause": "再生を一時停止",
      "paused": "一時停止しました。",
      "position": (n, total) => `全${total}ステップ中のステップ${n}。`,
      "previous": "前のステップ",
      "next": "次のステップ"
    },
    "ko": {
      "play": "단계 재생",
      "pause": "재생 일시 정지",
      "paused": "일시 정지했습니다. ",
      "position": (n, total) => `전체 ${total}단계 중 ${n}단계. `,
      "previous": "이전 단계",
      "next": "다음 단계"
    }
  };
  // Prefer the full locale, then its parents, and finally English.
  const LOCALE_ALIASES = { "zh-tw": "zh-hant", "zh-hk": "zh-hant", "zh-mo": "zh-hant" };
  const resolveLabels = (language) => {
    let locale = language.trim().toLowerCase().replaceAll("_", "-");
    while (locale) {
      const candidate = Object.prototype.hasOwnProperty.call(LOCALE_ALIASES, locale)
        ? LOCALE_ALIASES[locale] : locale;
      if (Object.prototype.hasOwnProperty.call(LABELS, candidate)) return LABELS[candidate];
      const separator = locale.lastIndexOf("-");
      locale = separator === -1 ? "" : locale.slice(0, separator);
    }
    return LABELS.en;
  };
  const labels = resolveLabels(document.documentElement.lang);
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
    button.setAttribute("aria-label", labels.play);

    glyph.className = "animation-controls__play-glyph";

    icon.setAttribute("preserveAspectRatio", "xMidYMid meet");
    glyph.append(icon);

    srOnly.className = "animation-controls__sr-only";
    srOnly.textContent = labels.play;

    button.append(glyph, srOnly);
    return { button, srOnly, icon, iconPath };
  };

  // Linked content tabs issue synthetic clicks in other figures. Only the
  // sequence receiving the reader's own interaction may announce that change.
  let interactionSet = null;
  for (const type of ["click", "keydown"]) document.addEventListener(type, event => {
    if (event.isTrusted) interactionSet = event.target.closest?.(".tabbed-set") || null;
  }, true);

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
      ariaLabel: labels.previous,
      path: FA_ARROW_LEFT_PATH,
    });
    const pageIndicator = document.createElement("span");
    pageIndicator.className = "animation-controls__page";
    pageIndicator.setAttribute("aria-live", "off");
    const announcement = document.createElement("span");
    announcement.className = "animation-controls__sr-only";
    announcement.setAttribute("aria-live", "polite");
    announcement.setAttribute("aria-atomic", "true");

    const nextButton = createIconButton({
      className: "animation-controls__next",
      ariaLabel: labels.next,
      path: FA_ARROW_RIGHT_PATH,
    });

    nav.append(prevButton, pageIndicator, nextButton);
    controls.append(playButton, nav, announcement);
    tabbedContent.insertAdjacentElement("afterend", controls);

    let announcementTimer = null, announcementOrigin = null;
    let announcementCount = 0, announcementJump = false;
    const frames = [...tabbedContent.querySelectorAll('ha-svg-figure[data-book-key]')];

    const state = {
      inputs,
      currentIndex: getCheckedIndex(inputs),
      intervalId: null,
      timeoutId: null,
      isPlaying: false,
    };

    const updatePlayButton = () => {
      const label = state.isPlaying ? labels.pause : labels.play;
      playButton.setAttribute("aria-label", label);
      playButton.classList.toggle("is-playing", state.isPlaying);
      playControl.srOnly.textContent = label;
      playControl.icon.setAttribute("viewBox", state.isPlaying ? "0 0 384 512" : "0 0 448 512");
      playControl.icon.setAttribute("width", state.isPlaying ? "10" : "12");
      playControl.iconPath.setAttribute("d", state.isPlaying ? FA_PAUSE_PATH : FA_PLAY_PATH);
    };

    const setText = (node, value) => {
      if (node.textContent !== value) node.textContent = value;
    };
    const updatePageIndicator = () => {
      pageIndicator.setAttribute("aria-hidden", state.isPlaying ? "true" : "false");
      setText(pageIndicator, `${state.currentIndex + 1} / ${inputs.length}`);
      prevButton.setAttribute("aria-disabled", String(state.currentIndex === 0));
      nextButton.setAttribute("aria-disabled", String(state.currentIndex === inputs.length - 1));
    };

    const cancelAnnouncement = () => {
      if (announcementTimer !== null) clearTimeout(announcementTimer);
      announcementTimer = null; announcementOrigin = null; announcementCount = 0; announcementJump = false;
      announcement.textContent = "";
    };
    const announce = (previous, jump = false) => {
      if (announcementTimer !== null) clearTimeout(announcementTimer);
      if (announcementOrigin === null) announcementOrigin = previous;
      announcementCount++; announcementJump ||= jump;
      announcement.textContent = "";
      announcementTimer = setTimeout(() => {
        const index = state.currentIndex;
        const forward = !announcementJump && announcementCount === 1 && index === announcementOrigin + 1;
        const moved = index !== announcementOrigin;
        announcementTimer = null; announcementOrigin = null; announcementCount = 0; announcementJump = false;
        if (!moved) return;
        const prefix = labels.position(index + 1, inputs.length);
        const frame = frames[index];
        announcement.textContent = prefix + (frame?.dataset[forward ? "a11yForward" : "a11yState"] ||
          inputs[index].getAttribute("aria-label") || "");
      }, 250);
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
      updatePageIndicator();
    };

    const syncCurrentIndex = () => {
      state.currentIndex = getCheckedIndex(inputs);
    };

    const moveTo = (index, manual = false) => {
      const previous = state.currentIndex;
      state.currentIndex = setCheckedIndex(inputs, manual ? Math.max(0, Math.min(inputs.length - 1, index)) : index);
      updatePageIndicator();
      if (manual && state.currentIndex !== previous) announce(previous);
    };

    const step = (delta, manual = false) => {
      moveTo(state.currentIndex + delta, manual);
    };

    const start = () => {
      if (state.isPlaying) {
        return;
      }
      state.isPlaying = true;
      cancelAnnouncement();
      updatePlayButton();
      updatePageIndicator();
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
        cancelAnnouncement();
        announcementTimer = setTimeout(() => {
          announcementTimer = null;
          const index = state.currentIndex;
          const prefix = labels.position(index + 1, inputs.length);
          announcement.textContent = labels.paused + prefix + (frames[index]?.dataset.a11yState || "");
        }, 250);
        return;
      }
      syncCurrentIndex();
      start();
    });

    prevButton.addEventListener("click", () => {
      stop();
      syncCurrentIndex();
      step(-1, true);
    });

    nextButton.addEventListener("click", () => {
      stop();
      syncCurrentIndex();
      step(1, true);
    });

    inputs.forEach((input, index) => {
      input.addEventListener("change", () => {
        if (input.checked) {
          stop();
          const previous = state.currentIndex;
          state.currentIndex = index;
          updatePageIndicator();
          if (interactionSet === tabbedSet) {
            interactionSet = null;
            if (index !== previous) announce(previous, true);
          }
        }
      });
    });

    controllers.add(stop);
    tabbedSet.addEventListener("focusin", event => {
      if (state.isPlaying && event.target !== playButton) stop();
    });
    tabbedSet.addEventListener("figureinteractionpending", stop);
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
