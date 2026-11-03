/* Below-fold demos load near the viewport and never animate in reduced motion. */
(() => {
  const reduced = matchMedia('(prefers-reduced-motion: reduce)');
  let observer;
  const videos = [...document.querySelectorAll('[data-home-video]')];
  const visible = new Set();
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
    if (!('IntersectionObserver' in window)) return;
    observer = new IntersectionObserver(entries => {
      for (const entry of entries) {
        const video = entry.target;
        if (entry.isIntersecting) visible.add(video); else visible.delete(video);
      }
      update();
    }, {rootMargin: '120px 0px'});
    videos.forEach(video => observer.observe(video));
  }
  document.addEventListener('visibilitychange', update);
  reduced.addEventListener('change', update);
  addEventListener('pagehide', () => {observer?.disconnect();visible.clear();update();});
  addEventListener('pageshow', start);
  start();
})();
