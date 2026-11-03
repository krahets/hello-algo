/* Host adapter: book theme state feeds the reusable figure resource runtime. */
(() => {
  const update = () => FigureWeb.setTheme(document.body?.dataset.mdColorScheme === 'slate' ? 'dark' : 'light');
  new MutationObserver(update).observe(document.documentElement, {
    subtree: true, attributes: true, attributeFilter: ['data-md-color-scheme']
  });
  update();
})();
