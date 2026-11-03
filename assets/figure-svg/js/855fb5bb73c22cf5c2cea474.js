/* Isolated figures; prepare a complete slideshow before its first transition. */
(() => {
  'use strict';
  if (customElements.get('ha-svg-figure')) return;
  const {resource, decode, fonts, variants:loadVariants, theme, available} = FigureWeb;
  const sequences = new WeakMap();
  function sequence(group) {
    if (sequences.has(group)) return sequences.get(group);
    let pending = null, intent = null;
    const prepare = () => {
      if (pending) return pending;
      group.dataset.figureState = 'loading'; group.setAttribute('aria-busy', 'true');
      pending = Promise.all([...group.querySelectorAll('ha-svg-figure')].map(host => host.prepare()))
        .then(results => {
          group.dataset.figureState = results.every(Boolean) ? 'ready' : 'error';
          group.removeAttribute('aria-busy');
          const target = intent; intent = null;
          if (group.dataset.figureState === 'ready' && target?.isConnected) target.click();
          return results.every(Boolean);
        }).finally(() => {pending = null;});
      return pending;
    };
    group.addEventListener('click', event => {
      const target = event.target.closest('.animation-controls button, .tabbed-labels label');
      if (!target || target.closest('.tabbed-set') !== group) return;
      if (group.dataset.figureState === 'ready') return;
      event.preventDefault(); event.stopImmediatePropagation();
      intent = target; prepare();
    }, true);
    const observer = new IntersectionObserver(entries => {
      if (entries.some(entry => entry.isIntersecting)) prepare();
    }, {rootMargin:'300px'});
    observer.observe(group);
    sequences.set(group, prepare);
    return prepare;
  }
  // A native SVG owns its font scope. Give its inline Shadow DOM copy the same
  // subset without a network request or a collision with another frame's glyphs.
  const embedded = new Map();
  async function prepareFaces(svg, revision) {
    const aliases = new Map(), loads = [];
    for (const style of svg.querySelectorAll('style')) {
      if (!style.textContent.includes('@font-face')) continue;
      const sheet = new CSSStyleSheet();
      sheet.replaceSync(style.textContent);
      for (const rule of sheet.cssRules) {
        if (rule.type !== CSSRule.FONT_FACE_RULE) continue;
        const family = rule.style.fontFamily.replace(/^["']|["']$/g, '');
        const alias = family + '-' + revision;
        const weight = rule.style.fontWeight || '400';
        const key = alias + ':' + weight;
        aliases.set(family, alias);
        if (!embedded.has(key)) {
          const face = new FontFace(alias, rule.style.getPropertyValue('src'), {weight});
          embedded.set(key, face.load().then(f => document.fonts.add(f))
            .catch(error => {embedded.delete(key); throw error;}));
        }
        loads.push(embedded.get(key));
      }
    }
    for (const node of svg.querySelectorAll('[font-family]')) {
      const alias = aliases.get(node.getAttribute('font-family'));
      if (alias) node.setAttribute('font-family', alias);
    }
    await Promise.all(loads);
  }
  function display(host, svg, model) {
    const style = document.createElement('style');
    style.textContent = ':host{color-scheme:normal}svg{display:block;width:100%;height:auto;background:var(--ha-figure-background,white)}svg:focus-visible{outline:2px solid #6a9d8a;outline-offset:-2px}';
    // Hidden steps have no layout. Prepare in an isolated, non-visible layout
    // surface, then move the finished SVG into its actual shadow tree atomically.
    const stage = document.createElement('div');
    stage.setAttribute('aria-hidden', 'true');
    stage.style.cssText = `position:fixed;left:-100000px;top:0;width:${svg.viewBox.baseVal.width}px;visibility:hidden;pointer-events:none`;
    const staging = stage.attachShadow({mode:'open'});
    staging.append(style, svg); document.body.append(stage);
    try {
      if (model) HelloAlgoReading.mount(svg, model);
      if (svg.reading?.state().issues.length) throw Error(svg.reading.state().issues.join('; '));
      const shadow = host.shadowRoot || host.attachShadow({mode:'open'});
      shadow.replaceChildren(style, svg);
    } catch (error) {
      svg.reading?.destroy(); throw error;
    } finally { stage.remove(); }
  }
  class BookFigure extends HTMLElement {
    connectedCallback() {
      this.generation = (this.generation || 0) + 1;
      this.dataset.state = 'pending';
      this.unsubscribe = FigureWeb.subscribe(() => {
        if (this.variants) this.showTheme();
        if (this.variants?.some(v => !available(v))) {this.loading = null; this.prepare();}
      });
      const group = this.closest('[data-figure-sequence]');
      if (group) {
        group.dataset.figureState = 'pending'; sequence(group);
      } else {
        this.observer = new IntersectionObserver(entries => {
          if (entries.some(entry => entry.isIntersecting)) {
            this.observer.disconnect(); this.prepare();
          }
        }, {rootMargin:'300px'});
        this.observer.observe(this);
      }
    }
    disconnectedCallback() {
      this.generation++; this.loading = null; this.variants = null;
      this.showStatic();
      this.observer?.disconnect();
      this.unsubscribe?.();
    }
    prepare() {
      if (!this.loading) this.loading = this.load(this.generation);
      return this.loading;
    }
    showStatic() {
      this.displayed = null;
      this.shadowRoot?.querySelector('svg')?.reading?.destroy();
      // The native document stays in the light DOM throughout enhancement.
      this.shadowRoot?.replaceChildren(document.createElement('slot'));
      this.dataset.state = 'static';
    }
    showTheme() {
      const chosen = this.variants[this.dataset.darkSrc ? theme() : 0];
      if (!available(chosen)) {this.showStatic(); return;}
      if (chosen === this.displayed) return;
      try {
        const previous = this.shadowRoot?.querySelector('svg');
        display(this, chosen.svg.cloneNode(true), chosen.reading);
        previous?.reading?.destroy();
        this.displayed = chosen;
        this.dataset.state = 'ready';
      } catch (error) {
        this.showStatic();
        console.warn('Could not enhance book figure', this.dataset.src, error);
      }
    }
    async load(generation) {
      try {
        const urls = [this.dataset.src, this.dataset.darkSrc].filter(Boolean);
        const variants = await loadVariants(urls, async value => {
          const url = new URL(value, document.baseURI).href;
          const model = await resource(url, true);
          if (model.version !== 1) throw Error('Unknown figure package');
          const svgURL = new URL(model.svg, url).href;
          // A cached reading model must only enhance its matching SVG revision.
          const integrity = model.svg_sha256 ? 'sha256-' + btoa(String.fromCharCode(
            ...model.svg_sha256.match(/../g).map(pair => parseInt(pair, 16)))) : '';
          const [source] = await Promise.all([
            resource(svgURL, false, integrity),
            fonts(model.fonts),
          ]);
          const parsed = new DOMParser().parseFromString(source, 'image/svg+xml');
          const svg = parsed.documentElement;
          if (svg.localName !== 'svg' || parsed.querySelector('parsererror, script')) throw Error('Invalid figure SVG');
          const images = [];
          for (const node of svg.querySelectorAll('*')) for (const attr of [...node.attributes]) {
            if (attr.localName === 'href' && !attr.value.startsWith('#')) {
              attr.value = new URL(attr.value, svgURL).href;
              if (node.localName === 'image') images.push(decode(attr.value));
            }
          }
          await Promise.all([...images, prepareFaces(svg, model.svg_sha256)]);
          return {svg:document.importNode(svg,true),reading:model.reading};
        });
        if (!this.isConnected || this.generation !== generation) return false;
        this.variants = variants;
        this.showTheme();
        this.dataset.themeState = variants.some(v => !available(v)) ? 'partial' : 'ready';
        this.dispatchEvent(new CustomEvent('figureready', {bubbles:true}));
        return true;
      } catch (error) {
        if (!this.isConnected || this.generation !== generation) return false;
        this.showStatic();
        console.warn('Could not enhance book figure', this.dataset.src, error);
        return true;
      }
    }
  }
  customElements.define('ha-svg-figure', BookFigure);
})();
