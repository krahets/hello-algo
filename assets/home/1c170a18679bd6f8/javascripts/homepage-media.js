/* Load the first view first, then prepare below-fold media without requiring scroll. */
(() => {
  const reduced = matchMedia('(prefers-reduced-motion: reduce)');
  const videos = [...document.querySelectorAll('[data-home-video]')];
  const images = [...document.querySelectorAll('[data-home-src]')];
  const visible = new Set();
  let observer, preloadTask = null;

  // A broken or stalled resource must not block everything below it.
  function settled(element, events, start, timeout = 10000) {
    return new Promise(resolve => {
      const finish = () => {
        clearTimeout(timer);
        events.forEach(event => element.removeEventListener(event, finish));
        resolve();
      };
      const timer = setTimeout(finish, timeout);
      events.forEach(event => element.addEventListener(event, finish));
      start();
      if (element instanceof HTMLImageElement && element.complete) finish();
      if (element instanceof HTMLVideoElement && element.readyState >= 4) finish();
    });
  }
  function reveal(element) {
    if (element.dataset.homeSrc && !element.getAttribute('src')) {
      element.loading = 'eager';
      element.src = element.dataset.homeSrc;
    }
    if (element.dataset.homePoster && !element.getAttribute('poster')) element.poster = element.dataset.homePoster;
  }
  function load(video) {
    if (!video.getAttribute('src')) {
      video.preload = 'auto';
      video.src = video.dataset.homeVideo;
      video.load();
    }
  }
  function update() {
    for (const video of videos) {
      if (document.hidden || reduced.matches || !visible.has(video)) video.pause();
      else { reveal(video); load(video); video.play().catch(() => {}); }
    }
  }
  async function foreground() {
    if (!document.hidden) return;
    await new Promise(resolve => {
      const resume = () => {
        if (document.hidden) return;
        document.removeEventListener('visibilitychange', resume);
        resolve();
      };
      document.addEventListener('visibilitychange', resume);
    });
  }
  function preload() {
    if (!preloadTask) preloadTask = prepare().finally(() => { preloadTask = null; });
    return preloadTask;
  }
  async function prepare() {
    const heroReady = document.querySelector('.home-universe-bg')?.homeReady;
    // Covers missing scene scripts or a stalled texture without holding the page forever.
    await new Promise(resolve => {
      const timer = setTimeout(resolve, 10000);
      Promise.resolve(heroReady).then(() => { clearTimeout(timer); resolve(); });
    });
    // Still images in document order first, so videos cannot delay portraits and covers.
    for (const element of document.querySelectorAll('[data-home-src], [data-home-poster]')) {
      await foreground();
      if (element.dataset.homePoster) {
        const poster = new Image();
        await settled(poster, ['load', 'error'], () => { reveal(element); poster.src = element.dataset.homePoster; });
      } else {
        await settled(element, ['load', 'error'], () => reveal(element));
      }
    }
    for (const video of videos) {
      await foreground();
      if (reduced.matches) continue;
      // preload is a browser hint; it may limit buffering on constrained connections.
      await settled(video, ['canplaythrough', 'error'], () => load(video));
    }
  }
  function start() {
    observer?.disconnect();
    if (!('IntersectionObserver' in window)) return;
    // Scrolling ahead bypasses the background queue; playback requires actual visibility.
    observer = new IntersectionObserver(entries => {
      for (const entry of entries) {
        const element = entry.target;
        if (entry.isIntersecting) reveal(element);
        if (element.tagName === 'VIDEO') {
          if (entry.isIntersecting) visible.add(element); else visible.delete(element);
        } else if (entry.isIntersecting) observer.unobserve(element);
      }
      update();
    });
    [...images, ...videos].forEach(element => observer.observe(element));
  }
  document.addEventListener('visibilitychange', update);
  reduced.addEventListener('change', () => {
    update();
    if (!reduced.matches) (preloadTask || Promise.resolve()).then(() => {
      if (!reduced.matches) preload();
    });
  });
  addEventListener('pagehide', () => {observer?.disconnect();visible.clear();update();});
  addEventListener('pageshow', start);
  if (document.readyState === 'complete') preload();
  else addEventListener('load', preload, {once: true});
  start();
})();
