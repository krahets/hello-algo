/* Below-fold demos load near the viewport and never animate in reduced motion. */
(() => {
  const reduced = matchMedia('(prefers-reduced-motion: reduce)');
  let observer;
  const videos = [...document.querySelectorAll('[data-home-video]')];
  const images = [...document.querySelectorAll('[data-home-src]')];
  const visible = new Set();
  function reveal(element) {
    if (element.dataset.homeSrc && !element.getAttribute('src')) element.src = element.dataset.homeSrc;
    if (element.dataset.homePoster && !element.getAttribute('poster')) element.poster = element.dataset.homePoster;
  }
  function load(video) {
    if (!video.getAttribute('src')) {
      video.src = video.dataset.homeVideo;
      video.load();
    }
  }
  function update() {
    for (const video of videos) {
      if (document.hidden || reduced.matches || !visible.has(video)) video.pause();
      else { load(video); video.play().catch(() => {}); }
    }
  }
  function start() {
    observer?.disconnect();
    if (!('IntersectionObserver' in window)) { [...images, ...videos].forEach(reveal); return; }
    observer = new IntersectionObserver(entries => {
      for (const entry of entries) {
        const element = entry.target;
        if (entry.isIntersecting) reveal(element);
        if (element.tagName === 'VIDEO') {
          if (entry.isIntersecting) visible.add(element); else visible.delete(element);
        } else if (entry.isIntersecting) observer.unobserve(element);
      }
      update();
    }, {rootMargin: '120px 0px'});
    [...images, ...videos].forEach(element => observer.observe(element));
  }
  document.addEventListener('visibilitychange', update);
  reduced.addEventListener('change', update);
  addEventListener('pagehide', () => {observer?.disconnect();visible.clear();update();});
  addEventListener('pageshow', start);
  start();
})();
